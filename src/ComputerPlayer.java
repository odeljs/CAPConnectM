import java.util.Random;

public class ComputerPlayer implements IPlayer {
    //region Fields
    private static Random _rand = new Random();
    private char _playerCharacter = 'X';
    //endregion

    //region Constructor
    public ComputerPlayer(char playerCharacter) {
        _playerCharacter = playerCharacter;
    }
    //endregion

    //region IPlayer
    public int RequestMove(Gameboard board) {
        // TODO : Places random piece for now
        return _rand.nextInt() % board.getN();
    }

    /**
     * Return the players character piece e.g 'X'
     */
    public char getPlayerCharacter() {
        return _playerCharacter;
    }
    //endregion
}