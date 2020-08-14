<?php
/**
 * Account editor
 *
 * @package   MyAAC
 * @author    Lee
 * @copyright 2019 MyAAC
 * @link      https://my-aac.org
 */
defined('MYAAC') or die('Direct access not allowed!');

$title = 'Account editor';
$base = BASE_URL . 'admin/?p=accounts';

if ($config['account_country'])
	require SYSTEM . 'countries.conf.php';

function echo_success($message)
{
	echo '<p class="success">' . $message . '</p>';
}

function echo_error($message)
{
	global $error;
	echo '<p class="error">' . $message . '</p>';
	$error = true;
}

function verify_number($number, $name, $max_length)
{
	if (!Validator::number($number))
		echo_error($name . ' can contain only numbers.');

	$number_length = strlen($number);
	if ($number_length <= 0 || $number_length > $max_length)
		echo_error($name . ' cannot be longer than ' . $max_length . ' digits.');
}

$hasSecretColumn = $db->hasColumn('accounts', 'secret');
$hasCoinsColumn = $db->hasColumn('accounts', 'coins');
$hasPointsColumn = $db->hasColumn('accounts', 'premium_points');
$hasTypeColumn = $db->hasColumn('accounts', 'type');
$hasGroupColumn = $db->hasColumn('accounts', 'group_id');

if ($config['account_country']) {
	$countries = array();
	foreach (array('pl', 'se', 'br', 'us', 'gb') as $c)
		$countries[$c] = $config['countries'][$c];

	$countries['--'] = '----------';
	foreach ($config['countries'] as $code => $c)
		$countries[$code] = $c;
}
?>

<link rel="stylesheet" type="text/css" href="<?php echo BASE_URL; ?>tools/css/jquery.datetimepicker.css"/ >
<script src="<?php echo BASE_URL; ?>tools/js/jquery.datetimepicker.js"></script>

<?php
$id = 0;
if (isset($_REQUEST['id']))
	$id = (int)$_REQUEST['id'];
else if (isset($_REQUEST['search_name'])) {
	if (strlen($_REQUEST['search_name']) < 3 && !Validator::number($_REQUEST['search_name'])) {
		echo 'Player name is too short.';
	} else {
		if (Validator::number($_REQUEST['search_name']))
			$id = $_REQUEST['search_name'];
		else {
			$query = $db->query('SELECT `id` FROM `accounts` WHERE `name` = ' . $db->quote($_REQUEST['search_name']));
			if ($query->rowCount() == 1) {
				$query = $query->fetch();
				$id = $query['id'];
			} else {
				$query = $db->query('SELECT `id`, `name` FROM `accounts` WHERE `name` LIKE ' . $db->quote('%' . $_REQUEST['search_name'] . '%'));
				if ($query->rowCount() > 0 && $query->rowCount() <= 10) {
					echo 'Do you mean?<ul>';
					foreach ($query as $row)
						echo '<li><a href="' . $base . '&id=' . $row['id'] . '">' . $row['name'] . '</a></li>';
					echo '</ul>';
				} else if ($query->rowCount() > 10)
					echo 'Specified name resulted with too many accounts.';
			}
		}
	}
}
$groups = new OTS_Groups_List();
if ($id > 0) {
	$account = new OTS_Account();
	$account->load($id);

	if (isset($account, $_POST['save']) && $account->isLoaded()) {// we want to save
		$error = false;

		$_error = '';
		$account_db = new OTS_Account();
		if(USE_ACCOUNT_NAME) {
			$name = $_POST['name'];

			$account_db->find($name);
			if ($account_db->isLoaded() && $account->getName() != $name)
				echo_error('This name is already used. Please choose another name!');
		}

		$account_db->load($id);
		if (!$account_db->isLoaded())
			echo_error('Account with this id doesn\'t exist.');

		//type/group
		if($hasTypeColumn || $hasGroupColumn) {
			$group = $_POST['group'];
		}

		$password = ((!empty($_POST["pass"]) ? $_POST['pass'] : null));
		if (!Validator::password($password)) {
			$errors['password'] = Validator::getLastError();
		}

		//secret
		if($hasSecretColumn) {
			$secret = $_POST['secret'];
		}

		//key
		$key = $_POST['key'];
		$email = $_POST['email'];
		if (!Validator::email($email))
			$errors['email'] = Validator::getLastError();

		//tibia coins
		if ($hasCoinsColumn) {
			$t_coins = $_POST['t_coins'];
			verify_number($t_coins, 'Tibia coins', 12);
		}
		// prem days
		$p_days = (int)$_POST['p_days'];
		verify_number($p_days, 'Prem days', 11);

		//prem points
		$p_points = $_POST['p_points'];
		verify_number($p_points, 'Prem Points', 11);

		//rl name
		$rl_name = $_POST['rl_name'];

		//location
		$rl_loca = $_POST['rl_loca'];

		//country
		$rl_country = $_POST['rl_country'];

		$web_flags = $_POST['web_flags'];
		verify_number($web_flags, 'Web Flags', 1);

		//created
		$created = $_POST['created'];
		verify_number($created, 'Created', 11);

		//web last login
		$web_lastlogin = $_POST['web_lastlogin'];
		verify_number($web_lastlogin, 'Web Last logout', 11);

		if (!$error) {
			if(USE_ACCOUNT_NAME) {
				$account->setName($name);
			}

			if ($hasTypeColumn) {
				$account->setCustomField('type', $group);
			} elseif ($hasGroupColumn) {
				$account->setCustomField('group_id', $group);
			}

			if($hasSecretColumn) {
				$account->setCustomField('secret', $secret);
			}
			$account->setCustomField('key', $key);
			$account->setEMail($email);
			if ($hasCoinsColumn) {
				$account->setCustomField('coins', $t_coins);
			}

			$lastDay = 0;
			if($p_days != 0 && $p_days != PHP_INT_MAX ) {
				$lastDay = time();
			} else if ($lastDay != 0) {
				$lastDay = 0;
			}

			$account->setPremDays($p_days);
			$account->setLastLogin($lastDay);
			if ($hasPointsColumn) {
				$account->setCustomField('premium_points', $p_points);
			}
			$account->setRLName($rl_name);
			$account->setLocation($rl_loca);
			$account->setCountry($rl_country);
			$account->setCustomField('created', $created);
			$account->setWebFlags($web_flags);
			$account->setCustomField('web_lastlogin', $web_lastlogin);

			if (isset($password)) {
				$config_salt_enabled = $db->hasColumn('accounts', 'salt');
				if ($config_salt_enabled) {
					$salt = generateRandomString(10, false, true, true);
					$password = $salt . $password;
					$account_logged->setCustomField('salt', $salt);
				}

				$password = encrypt($password);
				$account->setPassword($password);

				if ($config_salt_enabled)
					$account->setCustomField('salt', $salt);
			}

			$account->save();
			echo_success('Account saved at: ' . date('G:i'));
		}
	}
}

$search_account = '';
if (isset($_REQUEST['search_name']))
	$search_account = $_REQUEST['search_name'];
else if (isset($_REQUEST['search_account']))
	$search_account = $_REQUEST['search_account'];
else if ($id > 0 && isset($account) && $account->isLoaded()) {
	if(USE_ACCOUNT_NAME) {
		$search_account = $account->getName();
	}
	else {
		$search_account = $account->getId();
	}
}

?>
<div class="row">
	<?php if (isset($account) && $account->isLoaded()) { ?>

	<form action="<?php echo $base . ((isset($id) && $id > 0) ? '&id=' . $id : ''); ?>" method="post"
		  class="form-horizontal">
		<div class="col-md-8">
			<div class="box box-primary">
				<div class="box-body">
					<div class="row">
						<?php if(USE_ACCOUNT_NAME): ?>
						<div class="col-xs-4">
							<label for="name" class="control-label">Account Name:</label>
							<input type="text" class="form-control" id="name" name="name"
								   autocomplete="off" style="cursor: auto;"
								   value="<?php echo $account->getName(); ?>"/>
						</div>
						<?php endif; ?>
						<div class="col-xs-5">
							<label for="c_pass" class="control-label">Password: (check to change)</label>
							<div class="input-group">
                            <span class="input-group-addon">
                              <input type="checkbox"
									 name="c_pass"
									 id="c_pass"
									 value="false"
									 class="input_control"/>
                            </span>
								<input type="text" class="form-control" id="pass" name="pass"
									   autocomplete="off" maxlength="20"
									   value=""/>
							</div>
						</div>
						<div class="col-xs-3">
							<label for="account_id" class="control-label">Account ID:</label>
							<input type="text" class="form-control" id="account_id" name="account_id"
								   autocomplete="off" style="cursor: auto;" size="8" maxlength="11" disabled
								   value="<?php echo $account->getId(); ?>"/>
						</div>
					</div>
					<div class="row">
						<?php
						$acc_group = $account->getAccGroupId();
						if ($hasTypeColumn) {
							$acc_type = array("Normal", "Tutor", "Senior Tutor", "Gamemaster", "God"); ?>
							<div class="col-xs-6">
								<label for="group" class="control-label">Account Type:</label>
								<select name="group" id="group" class="form-control">
									<?php foreach ($acc_type as $id => $a_type): ?>
										<option value="<?php echo($id + 1); ?>" <?php echo($acc_group == ($id + 1) ? 'selected' : ''); ?>><?php echo $a_type; ?></option>
									<?php endforeach; ?>
								</select>
							</div>
							<?php
						} elseif ($hasGroupColumn) {
							?>
							<div class="col-xs-6">
								<label for="group" class="control-label">Account Type:</label>
								<select name="group" id="group" class="form-control">
									<?php
									foreach ($groups->getGroups() as $id => $group): ?>
										<option value="<?php echo $id; ?>" <?php echo($acc_group == $id ? 'selected' : ''); ?>><?php echo $group->getName(); ?></option>
									<?php endforeach; ?>
								</select>
							</div>
						<?php } ?>
						<div class="col-xs-6">
							<label for="web_flags" class="control-label">Website Access:</label>
							<select name="web_flags" id="web_flags" class="form-control">
								<?php $web_acc = array("None", "Admin", "Super Admin", "(Admin + Super Admin)");
								foreach ($web_acc as $id => $a_type): ?>
									<option value="<?php echo($id); ?>" <?php echo($account->getWebFlags() == ($id) ? 'selected' : ''); ?>><?php echo $a_type; ?></option>
								<?php endforeach; ?>
							</select>
						</div>
					</div>
					<div class="row">
						<?php if($hasSecretColumn): ?>
						<div class="col-xs-6">
							<label for="secret" class="control-label">Secret:</label>
							<input type="text" class="form-control" id="secret" name="secret"
								   autocomplete="off" style="cursor: auto;" size="8" maxlength="11"
								   value="<?php echo $account->getCustomField('secret'); ?>"/>
						</div>
						<?php endif; ?>
						<div class="col-xs-6">
							<label for="key" class="control-label">Key:</label>
							<input type="text" class="form-control" id="key" name="key"
								   autocomplete="off" style="cursor: auto;" size="8" maxlength="11"
								   value="<?php echo $account->getCustomField('key'); ?>"/>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6">
							<label for="email" class="control-label">Email:</label>
							<input type="text" class="form-control" id="email" name="email"
								   autocomplete="off" maxlength="20"
								   value="<?php echo $account->getEMail(); ?>"/>
						</div>
						<?php if ($hasCoinsColumn): ?>
							<div class="col-xs-6">
								<label for="t_coins" class="control-label">Tibia Coins:</label>
								<input type="text" class="form-control" id="t_coins" name="t_coins"
									   autocomplete="off" maxlength="8"
									   value="<?php echo $account->getCustomField('coins') ?>"/>
							</div>
						<?php endif; ?>
						<div class="col-xs-6">
							<label for="p_days" class="control-label">Premium Days:</label>
							<input type="text" class="form-control" id="p_days" name="p_days"
								   autocomplete="off" maxlength="11"
								   value="<?php echo $account->getPremDays(); ?>"/>
						</div>
						<?php if ($hasPointsColumn): ?>
							<div class="col-xs-6">
								<label for="p_points" class="control-label">Premium Points:</label>
								<input type="text" class="form-control" id="p_points" name="p_points"
									   autocomplete="off" maxlength="8"
									   value="<?php echo $account->getCustomField('premium_points') ?>"/>
							</div>
						<?php endif; ?>
					</div>
					<div class="row">
						<div class="col-xs-4">
							<label for="rl_name" class="control-label">RL Name:</label>
							<input type="text" class="form-control" id="rl_name" name="rl_name"
								   autocomplete="off" maxlength="20"
								   value="<?php echo $account->getRLName(); ?>"/>
						</div>
						<div class="col-xs-4">
							<label for="rl_loca" class="control-label">Location:</label>
							<input type="text" class="form-control" id="rl_loca" name="rl_loca"
								   autocomplete="off" maxlength="20"
								   value="<?php echo $account->getLocation(); ?>"/>
						</div>
						<div class="col-xs-4">
							<label for="rl_country" class="control-label">Country:</label>
							<select name="rl_country" id="rl_country" class="form-control">
								<?php foreach ($countries as $id => $a_type): ?>
									<option value="<?php echo($id); ?>" <?php echo($account->getCountry() == ($id) ? 'selected' : ''); ?>><?php echo $a_type; ?></option>
								<?php endforeach; ?>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4">
							<label for="created" class="control-label">Created:</label>
							<input type="text" class="form-control" id="created" name="created"
								   autocomplete="off" maxlength="20"
								   value="<?php echo $account->getCustomField('created'); ?>"/>
						</div>
						<div class="col-xs-4">
							<label for="web_lastlogin" class="control-label">Web Last Login:</label>
							<input type="text" class="form-control" id="web_lastlogin" name="web_lastlogin"
								   autocomplete="off" maxlength="20"
								   value="<?php echo $account->getCustomField('web_lastlogin'); ?>"/>
						</div>
					</div>

					<input type="hidden" name="save" value="yes"/>
					<div class="box-footer">
						<a href="<?php echo ADMIN_URL; ?>?p=accounts"><span class="btn btn-danger">Cancel</span></a>
						<div class="pull-right">
							<input type="submit" class="btn btn-primary" value="Update">
						</div>
					</div>

				</div>
			</div>
	</form>
</div>
<?php } ?>
<div class="col-md-4">
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">Search Account:</h3>
			<div class="box-tools pull-right">
				<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
				</button>
			</div>
		</div>

		<div class="box-body">
			<form action="<?php echo $base; ?>" method="post">
				<div class="input-group input-group-sm">
					<input type="text" class="form-control" name="search_name" value="<?php echo $search_account; ?>"
						   maxlength="32" size="32">
					<span class="input-group-btn">
                          <button type="submit" type="button" class="btn btn-info btn-flat">Search</button>
                        </span>
				</div>
			</form>
		</div>
	</div>
	<?php
	if (isset($account) && $account->isLoaded()) {
		$account_players = array();
		$query = $db->query('SELECT `name`,`level`,`vocation`  FROM `players` WHERE `account_id` = ' . $account->getId() . ' ORDER BY `name`')->fetchAll();
		if (isset($query)) {
			?>
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Character List:</h3>
				</div>
				<div class="box-body no-padding">
					<table class="table table-striped">
						<tbody>
						<tr>
							<th style="width: 10px">#</th>
							<th>Name</th>
							<th>Level</th>
							<th style="width: 40px">Edit</th>
						</tr>
						<?php
						$i = 1;
						foreach ($query as $p) {
							$account_players[] = $p;
							echo '<tr>
                            <td>' . $i . '.</td>
                            <td>' . $p['name'] . '</td>
                            <td>' . $p['level'] . '</td>
                            <td><a href="?p=players&search_name=' . $p['name'] . '"><span class="btn btn-success btn-sm edit btn-flat"><i class="fa fa-edit"></i></span></a></span></td>
                        </tr>';
							$i++;
						} ?>
						</tbody>
					</table>
				</div>
			</div>

			<?php
		};
	};
	?>
</div>

<script type="text/javascript">
	$('#lastlogout').datetimepicker({format: 'unixtime'});
	$('#created').datetimepicker({format: 'unixtime'});
	$('#web_lastlogin').datetimepicker({format: 'unixtime'});
	$(document).ready(function () {
		$('.input_control').change(function () {
			$('input[name=pass]')[0].disabled = !this.checked;
			$('input[name=pass]')[0].value = '';
		}).change();
	});
</script>
