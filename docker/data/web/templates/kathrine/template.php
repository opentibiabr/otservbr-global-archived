<?php
defined('MYAAC') or die('Direct access not allowed!');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<?php echo template_place_holder('head_start'); ?>
		<link rel="stylesheet" href="<?php echo $template_path; ?>/style.css" type="text/css" />
		<script type="text/javascript">
			<?php
				$twig->display('menu.js.html.twig', array('categories' => $config['menu_categories']));
			?>
		</script>
		<script type="text/javascript" src="tools/basic.js"></script>
		<script type="text/javascript">
			<?php
			$menus = get_template_menus();

			function get_template_pages($category) {
				global $menus;

				$ret = array();
				foreach($menus[$category] as $menu) {
					$ret[] = $menu['link'];
				}

				return $ret;
			}
			?>
			var category = '<?php
					if(strpos(URI, 'subtopic=') !== false) {
						$tmp = array($_REQUEST['subtopic']);
					}
					else {
						$tmp = URI;
						if(empty($tmp)) {
							$tmp = array('news');
						}
						else {
							$tmp = explode('/', URI);
						}
					}

				if(in_array($tmp[0], get_template_pages(MENU_CATEGORY_NEWS)))
					echo 'news';
				elseif(in_array($tmp[0], get_template_pages(MENU_CATEGORY_LIBRARY)))
						echo 'library';
				elseif(in_array($tmp[0], get_template_pages(MENU_CATEGORY_COMMUNITY)))
						echo 'community';
				elseif(in_array($tmp[0], array_merge(get_template_pages(MENU_CATEGORY_ACCOUNT), array('account'))))
					echo 'account';
				elseif(in_array($tmp[0], get_template_pages(MENU_CATEGORY_SHOP)))
					echo 'shops';
				?>';
		</script>
		<?php echo template_place_holder('head_end'); ?>
	</head>

	<body onload="initMenu();">
		<?php echo template_place_holder('body_start'); ?>
		<div id="top"></div>
		<div id="page">
		<!-- Keep all on center of browser -->

			<!-- Header Section -->
			<div id="header"></div>
			<!-- End -->

			<!-- Menu Section -->
			<div id="tabs">
				<?php
				foreach($config['menu_categories'] as $id => $cat) {
					if($id != MENU_CATEGORY_SHOP || $config['gifts_system']) { ?>
				<span id="<?php echo $cat['id']; ?>" onclick="menuSwitch('<?php echo $cat['id']; ?>');"><?php echo $cat['name']; ?></span>
				<?php
					}
				}
				?>
			</div>

			<div id="mainsubmenu">
				<?php
				$default_menu_color = "ffffff";

				foreach($menus as $category => $menu) {
					if(!isset($menus[$category])) {
						continue;
					}

					echo '<div id="' . $config['menu_categories'][$category]['id'] . '-submenu">';

					$size = count($menus[$category]);
					$i = 0;

					foreach($menus[$category] as $menu) {
						echo '<a href="' . $menu['link_full'] . '"' . ($menu['blank'] ? ' target="_blank"' : '') . ' style="color: #' . (strlen($menu['color']) == 0 ? $default_menu_color : $menu['color']) . ';">' . $menu['name'] . '</a>';

						if(++$i != $size) {
							echo '<span class="separator"></span>';
						}
					}

					echo '</div>';
				}
				?>
			</div>
			<!-- End -->

			<!-- Content Section -->
			<div id="content">
				<div id="margins">
					<table cellpadding="0" cellspacing="0" border="0" width="100%">
						<tr>
							<td><a href="<?php echo getLink('news'); ?>"><?php echo $config['lua']['serverName']; ?></a> &raquo; <?php echo $title; ?></td>
							<td>
							<?php
							if($status['online'])
								echo '
								<span style="color: green"><b>Server Online</b></span> &raquo;
								Players Online: ' . $status['players'] . ' / ' . $status['playersMax'] . ' &raquo;
								Monsters: ' . $status['monsters'] . ' &raquo; Uptime: ' . (isset($status['uptimeReadable']) ? $status['uptimeReadable'] : 'Unknown') . '';
							else
								echo '<span style="color: red"><b>Server Offline</b></span>';
							?>
							</td>
						</tr>
					</table>
					<hr noshade="noshade" size="1" />
					<div class="Content"><div id="ContentHelper">
					<?php echo tickers() . template_place_holder('center_top') . $content; ?>
					</div></div>
				</div>
			</div>
			<div id="content-bot"></div>
			<div id="copyrights">
				<p><?php echo template_footer(); ?></p>
<?php
	if($config['template_allow_change'])
		 echo '<span style="color: white">Template:</span><br/>' . template_form();
 ?>
			</div>
			<!-- End -->

		<!-- End -->
		</div>
		<?php echo template_place_holder('body_end'); ?>
	</body>
</html>
