<?php
/**
 * Experience stages
 *
 * @package   MyAAC
 * @author    Gesior <jerzyskalski@wp.pl>
 * @author    Slawkens <slawkens@gmail.com>
 * @copyright 2019 MyAAC
 * @link      https://my-aac.org
 */
defined('MYAAC') or die('Direct access not allowed!');
$title = 'Experience Stages';

if(file_exists($config['data_path'] . 'XML/stages.xml')) {
	$stages = new DOMDocument();
	$stages->load($config['data_path'] . 'XML/stages.xml');
}

if(!isset($config['lua']['experienceStages']) || !getBoolean($config['lua']['experienceStages']))
{
	$enabled = false;

	if(isset($stages)) {
		foreach($stages->getElementsByTagName('config') as $node) {
			if($node->getAttribute('enabled'))
				$enabled = true;
		}
	}

	if(!$enabled) {
		$rate_exp = 'not set';
		if(isset($config['lua']['rateExperience']))
			$rate_exp = $config['lua']['rateExperience'];
		else if(isset($config['lua']['rateExp']))
			$rate_exp = $config['lua']['rateExp'];
		else if(isset($config['lua']['rate_exp']))
			$rate_exp = $config['lua']['rate_exp'];

		echo 'Server is not configured to use experience stages.<br/>Current experience rate is: <b>x' .  $rate_exp . '</b>';
		return;
	}
}

if(!$stages)
{
	echo 'Error: cannot load <b>stages.xml</b>!';
	return;
}

echo '<div style="text-align:center"><h3>Experience stages</h3></div>
<table bgcolor="'.$config['darkborder'].'" border="0" cellpadding="4" cellspacing="1" width="100%"><tbody>
	<tr bgcolor="'.$config['vdarkborder'].'">
		<td class="white" colspan="5"><b>Stages table</b></td>
	</tr>
	<tr><td>
		<table border="0" cellpadding="2" cellspacing="1" width="100%"><tbody>
			<tr bgcolor="'.$config['lightborder'].'"><td><b>Level</b></td><td><b>Stage</b></td></tr>';
	foreach($stages->getElementsByTagName('stage') as $stage)
	{
		$maxlevel = $stage->getAttribute('maxlevel');
	echo '<tr bgcolor="'.$config['lightborder'].'">
	<td>'.$stage->getAttribute('minlevel') . '-'. (isset($maxlevel[0]) ? $maxlevel : '*') . '</td><td>x'.$stage->getAttribute('multiplier').'</td>
</tr>';
}
	echo '
		</tbody></table>
	</td></tr>
</tbody></table>';
?>
