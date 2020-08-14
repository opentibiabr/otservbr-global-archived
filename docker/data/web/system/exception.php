<?php

require LIBS . 'SensitiveException.php';

/**
 * @param Exception $exception
 */
function exception_handler($exception) {
	$message = $exception->getMessage();
	if($exception instanceof SensitiveException) {
		$message = 'This error is sensitive and has been logged into ' . LOGS . 'error.log.<br/>View this file for more information.';

		// log error to file
		$f = fopen(LOGS . 'error.log', 'ab');
		if(!$f) {
			$message = 'We wanted to save detailed informations about this error, but file: ' . LOGS . "error.log couldn't be opened for writing.. so the detailed information couldn't be saved.. are you sure directory system/logs is writable by web server? Correct this, and then refresh this site.";
		}
		else {
			fwrite($f, '[' . date(DateTime::RFC1123) . '] ' . $exception->getMessage() . PHP_EOL);
			fclose($f);
		}
	}

	$backtrace_formatted = nl2br($exception->getTraceAsString());

	// display basic error message without template
	// template is missing, why? probably someone deleted templates dir, or it wasn't downloaded right
	$template_file = SYSTEM . 'templates/exception.html.twig';
	if(!file_exists($template_file)) {
		echo 'Something went terribly wrong..<br/><br/>';
		echo "$message<br/><br/>";
		echo 'Backtrace:<br>';
		echo $backtrace_formatted;
		return;
	}

	// display beautiful error message
	// the file is .twig.html, but its not really parsed by Twig
	// we just replace some values manually
	// cause in case Twig throws exception, we can show it too
	$content = file_get_contents($template_file);
	$content = str_replace(array('{{ BASE_URL }}', '{{ message }}', '{{ backtrace }}', '{{ powered_by }}'), array(BASE_URL, $message, $backtrace_formatted, base64_decode('UG93ZXJlZCBieSA8YSBocmVmPSJodHRwOi8vbXktYWFjLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPk15QUFDLjwvYT4=')), $content);

	echo $content;
}

set_exception_handler('exception_handler');
