<?php

/**#@+
 * @version 0.0.2
 * @since 0.0.2
 */

/**
 * POT compatibility assurance package.
 * 
 * This package makes you sure that POT scripts won't cause FATAL errors on PHP older PHP 5.x versions. However remember that some PHP features won't be enabled with it. For example if you have PHP 5.0.x, this package will define Countable interface for you so PHP will know it, but it won't allow you to use count($countableObject) structure.
 * 
 * Note that you need to include this file before any other POT file or they will cause FATAL errors.
 * 
 * @package POT
 * @version 0.1.2
 * @subpackage compat
 * @author Wrzasq <wrzasq@gmail.com>
 * @copyright 2007 - 2008 (C) by Wrzasq
 * @license http://www.gnu.org/licenses/lgpl-3.0.txt GNU Lesser General Public License, Version 3
 * @tutorial POT/PHP_5.0.pkg
 */

// OutOfBoundsException class for 5.0.x
if( !class_exists('OutOfBoundsException') )
{
/**
 * @ignore
 * @version 0.1.0
 * @since 0.1.0
 */
    class OutOfBoundsException extends Exception
    {
    }
}

// LogicException class for 5.0.x
if( !class_exists('LogicException') )
{
/**
 * @ignore
 * @version 0.1.2
 * @since 0.1.2
 */
    class LogicException extends Exception
    {
    }
}

// Countable for PHP 5.0.x
if( !interface_exists('Countable') )
{
/**
 * @ignore
 */
    interface Countable
    {
        public function count();
    }
}

// spl_autoload_register() walkaround
if( !function_exists('spl_autoload_register') )
{
/**
 * @ignore
 */
    function spl_autoload_register($callback)
    {
        if( !function_exists('__autoload') )
        {
/**
 * @ignore
 */
            function __autoload($class)
            {
                POT::getInstance()->loadClass($class);
            }
        }
    }
}

/**#@-*/

?>
