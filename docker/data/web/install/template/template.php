<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $locale['direction']; ?>" lang="<?php echo $locale['lang']; ?>" xml:lang="<?php echo $locale['lang']; ?>">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<?php echo $locale['encoding']; ?>" />
	<title>MyAAC - <?php echo $locale['installation']; ?></title>
	<link rel="stylesheet" type="text/css" href="template/style.css" />
	<script type="text/javascript" src="<?php echo BASE_URL; ?>tools/js/jquery.min.js"></script>
</head>
<body>
	<div id="wrapper">
		<!--div class="buffer"-->
			<div id="header">
				<h1>MyAAC <?php echo $locale['installation']; ?></h1>
			</div>

			<div id="body">

				<div id="sidebar">
					<h2><?php echo $locale['steps']; ?></h2>
					<ul>
						<?php
							$i = 0;
							foreach($steps as $key => $value)
								echo '<li' . ($step == $value ? ' class="current"' : '') . '>' . ++$i . '. ' . $locale['step_' . $value] . '</li>';
						?>
					</ul>
				</div>

				<div id="content">
					<?php
						if(isset($locale['step_' . $step . '_title']))
							echo '<h1>' . $locale['step_' . $step . '_title'] . '</h1>';
						else
							echo '<h1>' . $locale['step_' . $step] . '</h1>';
						echo $content;
					?>
				</div>

				<div class="break"></div>
			</div>
		<!--/div-->
	</div>

	<div id="footer">
		<p style="text-align: center;"><?php echo base64_decode('UG93ZXJlZCBieSA8YSBocmVmPSJodHRwOi8vbXktYWFjLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPk15QUFDLjwvYT4='); ?></p>
	</div>
</body>
</html>