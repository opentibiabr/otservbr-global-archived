<?php defined('MYAAC') or die('Direct access not allowed!'); ?>
<!DOCTYPE html>
<html>
<head>
	<?php echo template_header(true);
	$title_full =  (isset($title) ? $title . $config['title_separator'] : '') . $config['lua']['serverName'];
	?>

	<title><?php echo $title_full ?></title>
	<link rel="shortcut icon" href="<?php echo BASE_URL; ?>images/favicon.ico" type="image/x-icon" />
	<link rel="icon" href="<?php echo BASE_URL; ?>images/favicon.ico" type="image/x-icon" />
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

	<link rel="stylesheet" href="<?php echo BASE_URL; ?>tools/css/bootstrap.min.css">
	<link rel="stylesheet" href="<?php echo BASE_URL; ?>tools/css/AdminLTE.min.css">
	<link rel="stylesheet" href="<?php echo BASE_URL; ?>tools/css/skins/skin-blue.min.css">
	<link rel="stylesheet" href="<?php echo BASE_URL; ?>tools/css/font-awesome.min.css">
	<link rel="stylesheet" href="<?php echo BASE_URL; ?>tools/css/ionicons.min.css">
	<link rel="stylesheet" href="<?php echo BASE_URL; ?>tools/css/jquery.dataTables.min.css">
	<link rel="stylesheet" type="text/css" href="<?php echo $template_path; ?>style.css"/>
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	<link rel="stylesheet"
		  href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
	<?php
	if ($logged && admin()) {
	?>
	<header class="main-header">
		<a href="." class="logo">
			<span class="logo-mini"><b>M</b>A</span>
			<span class="logo-lg"><b>My</b>AAC</span>
		</a>

		<nav class="navbar navbar-static-top" role="navigation">
			<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
				<span class="sr-only">Toggle navigation</span>
			</a>
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
					<li>
						<a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<aside class="main-sidebar">
		<section class="sidebar">
			<ul class="sidebar-menu" data-widget="tree">
				<li class="header">MyAAC</li>

				<?php
				$icons_a = array(
                    'dashboard','newspaper-o', 'envelope',
                    'book', 'list',
                    'plug', 'user',
                    'edit', 'gavel',
                    'wrench', 'edit', 'book', 'book',
                );

				$menus = array(
					'Dashboard' => 'dashboard',
					'News' => 'news',
					'Mailer' => 'mailer',
					'Pages' => 'pages',
					'Menus' => 'menus',
					'Plugins' => 'plugins',
					'Visitors' => 'visitors',
					'Editor' => array(
						'Accounts' => 'accounts',
						'Players' => 'players',
					),
					'Items' => 'items',
					'Tools' => array(
						'Notepad' => 'notepad',
						'phpinfo' => 'phpinfo',
					),
					'Logs' => array(
						'Logs' => 'logs',
						'Reports' => 'reports',
					),
				);

				$i = 0;
				foreach ($menus as $_name => $_page) {
					$has_child = is_array($_page);
					if (!$has_child) {
						echo '<li ';
						if ($page == $_page) echo ' class="active"';
						echo ">";
						echo '<a href="?p=' . $_page . '"><i class="fa fa-' . (isset($icons_a[$i]) ? $icons_a[$i] : 'link') . '"></i> <span>' . $_name . '</span></a></li>';
					}

					if ($has_child) {
						$used_menu = "";
						$nav_construct = '';
						foreach ($_page as $__name => $__page) {
							$nav_construct = $nav_construct . '<li';

							if ($page == $__page) {
								$nav_construct = $nav_construct . ' class="active"';
								$used_menu = true;
							}
							$nav_construct = $nav_construct . '><a href="?p=' . $__page . '"><i class="fa fa-circle-o"></i> ' . $__name . '</a></li>';
						}

						echo '<li class="treeview' . (($used_menu) ? ' menu-open' : '') . '">
                                      <a href="#"><i class="fa fa-' . (isset($icons_a[$i]) ? $icons_a[$i] : 'link') . '"></i> <span>' . $_name . '</span>
						              <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span></a>
						              <ul class="treeview-menu" style="' . (($used_menu) ? '  display: block' : ' display: none') . '">';
						echo $nav_construct;
						echo '</ul>
                                </li>';
					}
					$i++;
				}

				$query = $db->query('SELECT `name`, `page`, `flags` FROM `' . TABLE_PREFIX . 'admin_menu` ORDER BY `ordering`');
				$menu_db = $query->fetchAll();
				foreach ($menu_db as $item) {
					if ($item['flags'] == 0 || hasFlag($item['flags'])) {
						echo '<li ';
						if ($page == $item['page']) echo ' class="active"';
						echo ">";
						echo '<a href="?p=' . $item['page'] . '"><i class="fa fa-link"></i> <span>' . $item['name'] . '</span></a></li>';
					}
				}
				?>
			</ul>
		</section>
	</aside>

	<div class="content-wrapper">
		<section class="content-header">
			<h1><?php echo(isset($title) ? $title : ''); ?>
				<small> - Admin Panel</small>
				<div class="pull-right">
					<span class="label label-<?php echo(($status['online']) ? 'success' : 'danger'); ?>"><?php echo $config['lua']['serverName'] ?></span>
				</div>
			</h1>
		</section>
		<section class="content">
			<?php echo $content; ?>
		</section>

	</div>

	<footer class="main-footer">

		<div class="pull-right hidden-xs">
			<div id="status">
				<?php if ($status['online']): ?>
					<p class="success" style="width: 120px; text-align: center;">Server Online</p>
				<?php else: ?>
					<p class="error" style="width: 120px; text-align: center;">Server Offline</p>
				<?php endif; ?>
			</div>
		</div>
		<?php echo base64_decode('UG93ZXJlZCBieSA8YSBocmVmPSJodHRwOi8vbXktYWFjLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPk15QUFDLjwvYT4='); ?>
	</footer>

	<aside class="control-sidebar control-sidebar-dark">
		<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
			<li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
			<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="control-sidebar-home-tab">
				<h3 class="control-sidebar-heading">Account</h3>
				<ul class="control-sidebar-menu">
					<li>
						<a href="?action=logout">
							<i class="menu-icon fa  fa-sign-out bg-red"></i>
							<div class="menu-info">
								<h4 class="control-sidebar-subheading">Log out</h4>
								<p>This will log you out
									of <?php echo(USE_ACCOUNT_NAME ? $account_logged->getName() : $account_logged->getId()); ?></p>
							</div>
						</a>
					</li>
				</ul>
				<h3 class="control-sidebar-heading">Site</h3>
				<ul class="control-sidebar-menu">
					<li>
						<a href="<?php echo BASE_URL; ?>" target="_blank">
							<i class="menu-icon fa  fa-eye bg-blue"></i>
							<div class="menu-info">
								<h4 class="control-sidebar-subheading">Preview</h4>
								<p>This will open a new tab</p>
							</div>
						</a>
					</li>
				</ul>
			</div>
			<div class="tab-pane" id="control-sidebar-settings-tab">
				<form method="post">
					<h3 class="control-sidebar-heading">Version</h3>

					<div class="form-group">
						<label class="control-sidebar-subheading">
							<?php echo MYAAC_VERSION; ?> (<a href="?p=version">Check for updates</a>)<br/>
						</label>
						<label class="control-sidebar-subheading">
							<p><a href="https://github.com/slawkens/myaac" target="_blank">Github</a></p>
					</div>
				</form>
			</div>
		</div>
	</aside>
	<div class="control-sidebar-bg"></div>
</div>

<?php }
if (!$logged && !admin()) {
	echo $content;
}
?>

<script src="<?php echo BASE_URL; ?>tools/js/bootstrap.min.js"></script>
<script src="<?php echo BASE_URL; ?>tools/js/jquery-ui.min.js"></script>
<script src="<?php echo BASE_URL; ?>tools/js/jquery.dataTables.min.js"></script>
<script src="<?php echo BASE_URL; ?>tools/js/adminlte.min.js"></script>
</body>
</html>