<?php

/**
 * @package POT
 * @version 0.1.3
 * @author Wrzasq <wrzasq@gmail.com>
 * @copyright 2007 - 2008 (C) by Wrzasq
 * @license http://www.gnu.org/licenses/lgpl-3.0.txt GNU Lesser General Public License, Version 3
 */

/**
 * List of players.
 *
 * @package POT
 * @version 0.1.3
 */
class OTS_Players_List extends OTS_Base_List
{
/**
 * @version 0.0.5
 * @param OTS_Player $player Player to be deleted.
 * @deprecated 0.0.5 Use OTS_Player->delete().
 */
    public function deletePlayer(OTS_Player $player)
    {
        $this->db->exec('DELETE FROM ' . $this->db->tableName('players') . ' WHERE ' . $this->db->fieldName('id') . ' = ' . $player->getId() );
    }

/**
 * Sets list parameters.
 *
 * <p>
 * This method is called at object creation.
 * </p>
 *
 * @version 0.0.5
 * @since 0.0.5
 */
    public function init()
    {
        $this->table = 'players';
        $this->class = 'Player';
    }

/**
 * Returns string representation of object.
 *
 * <p>
 * If any display driver is currently loaded then it uses it's method.
 * </p>
 *
 * @version 0.1.3
 * @since 0.1.0
 * @return string String representation of object.
 */
    public function __toString()
    {
        $ots = POT::getInstance();

        // checks if display driver is loaded
        if( $ots->isDisplayDriverLoaded() )
        {
            return $ots->getDisplayDriver()->displayPlayersList($this);
        }

        return (string) $this->count();
    }
}

?>
