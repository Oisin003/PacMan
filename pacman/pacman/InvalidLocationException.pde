import java.io.Serializable;

public class InvalidLocationException extends Exception implements Serializable {

    public InvalidLocationException() {
        super();
    }

    public InvalidLocationException(String message) {
        super(message);
    }

    @Override
    public String getMessage() {
        return super.getMessage();
    }
}