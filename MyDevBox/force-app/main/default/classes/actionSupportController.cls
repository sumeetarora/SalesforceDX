public class actionSupportController {
    Integer count = 0;
 
    public void incrementCounter() {
            count++;
            //return null;
    }
 
    public void decrementCounter() {
            count--;
            //return null;
    }
 
    public Integer getCount() {
        return count;
    }
}