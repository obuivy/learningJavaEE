package entity;

/**
 * @author admin
 */
public class Log {
    private Book book;
    private String borrowTime;
    private int borrowDay;
    private String deadline;
    public Log(){
        borrowDay = 30;
    }

    public String getBorrowTime() {
        return borrowTime;
    }

    public void setBorrowTime(String borrowTime) {
        this.borrowTime = borrowTime;
    }

    public int getBorrowDay() {
        return borrowDay;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }
}
