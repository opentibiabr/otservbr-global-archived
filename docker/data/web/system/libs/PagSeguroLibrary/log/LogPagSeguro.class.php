<?php

/*
 ************************************************************************
 Copyright [2011] [PagSeguro Internet Ltda.]

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 ************************************************************************
 */

/**
 * Logging class
 */
class LogPagSeguro
{

    private static $log;
    private static $active;
    private static $fileLocation;

    private function __construct()
    {
        self::reLoad();
    }

    public static function init()
    {
        if (self::$log == null) {
            self::$log = new LogPagSeguro();
        }
        return self::$log;
    }

    public static function reLoad()
    {

        self::$active = PagSeguroConfig::logIsActive();
        if (self::$active) {
            $fileLocation = PagSeguroConfig::getLogFileLocation();

            if (file_exists($fileLocation) && is_file($fileLocation)) {
                self::$fileLocation = $fileLocation;
            } else {
                self::createFile();
            }
        }
    }

    /**
     * Creates the log file
     * @throws Exception
     * @return boolean
     */
    public static function createFile()
    {
        if (!self::$active) {
            return false;
        }
        $defaultPath = PagSeguroLibrary::getPath();
        $defaultName = 'PagSeguro.log';
        self::$fileLocation = $defaultPath . DIRECTORY_SEPARATOR . $defaultName;

        try {
            $f = fopen(self::$fileLocation, "a");
            
            if (!$f) {
                throw new Exception('Unable to open the input file');
            }
            
            fclose($f);
            return true;
        } catch (Exception $e) {
            echo $e->getMessage() . " - Can't create log file. Permission denied. File location: " .
                self::$fileLocation;
            return false;
        }

    }

    /**
     * Prints a info message in the log file
     * @param String $message
     */
    public static function info($message)
    {
        self::logMessage($message, 'info');
    }

    /**
     * Prints a warning message in the log file
     * @param String $message
     */
    public static function warning($message)
    {
        self::logMessage($message, 'warning');
    }

    /**
     * Prints an error message in the log file
     * @param String $message
     */
    public static function error($message)
    {
        self::logMessage($message, 'error');
    }

    /**
     * Prints a debug message in the log file
     * @param String $message
     */
    public static function debug($message)
    {
        self::logMessage($message, 'debug');
    }

    /**
     * Logs a message
     * @param String $message
     * @param String $type
     * @throws Exception
     * @return void|boolean
     */
    private static function logMessage($message, $type = null)
    {
        if (!self::$active) {
            return;
        }

        try {

            $file = fopen(self::$fileLocation, "a");
            
            if (!$file) {
                throw new Exception('Unable to open the input file');
            }
            
            $date_message = "{" . @date("Y/m/d H:i:s", time()) . "}";

            switch ($type) {
                case 'info':
                    $type_message = "[Info]";
                    break;
                case 'warning':
                    $type_message = "[Warning]";
                    break;
                case 'error':
                    $type_message = "[Error]";
                    break;
                case 'debug':
                default:
                    $type_message = "[Debug]";
                    break;
            }
            $str = "$date_message $type_message $message";
            fwrite($file, "$str \r\n");
            fclose($file);

        } catch (Exception $e) {
            echo $e->getMessage() . " - Can't create log file. Permission denied. File location: " .
                self::$fileLocation;
        }

    }

    /**
     * Retrieves the log messages
     * @param integer $negativeOffset
     * @param boolean|string $reverse
     *
     * @return boolean|string
     */
    public static function getHtml($negativeOffset = null, $reverse = null)
    {
        if (!self::$active) {
            return false;
        }
        if (file_exists(self::$fileLocation) && $file = file(self::$fileLocation)) {
            if ($negativeOffset !== null) {
                $file = array_slice($file, (-$negativeOffset), null, true);
            }
            if ($reverse) {
                $file = array_reverse($file, true);
            }
            $content = "";
            foreach ($file as $key => $value) {
                $html = ("<p>" . str_replace("\n", "<br>", $value) . "</p>");
                $html = str_replace("[", "<strong>", $html);
                $html = str_replace("]", "</strong>", $html);
                $html = str_replace("{", "<span>", $html);
                $html = str_replace("}", "</span>", $html);
                $content .= $html;
            }
        }
        return isset($content) ? $content : false;
    }
}
