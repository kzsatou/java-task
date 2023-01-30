import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.*;

public class TextReader {
    private String path;

    private static Logger logger = Logger.getLogger(TextReader.class.getName());

    //private static final String START = "START";
    //private static final String END = "END";
    //列挙型
    public enum Mark {
		START, END
	};


    private TextReader(String path) {
        this.path = path;
    }

    private void execute() {
        //List valueList = new ArrayList();
        //総称型に変更
        List<Integer> valueList = new ObjectList<>();

        //FileReader fr = null;
        //BufferedReader br = null;
        try(FileReader fr = new FileReader(path);
        BufferedReader br = new BufferedReader(fr);) {
            //fr = new FileReader(path);
            //br = new BufferedReader(fr);
            String line;
            while ((line = br.readLine()) != null) {
                //valueList.add(new Integer(line));
                valueList.add(Integer.parseInt(line));
            }
        } catch (IOException e) {
            e.printStackTrace();
        } 
        /*finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                }
            }
            if (fr != null) {
                try {
                    fr.close();
                } catch (IOException e) {
                }
            }
        }*/
        
        //int size = valueList.size();
        /*for (int i = 0; i < size; i++) {
            System.out.println(valueList.get(i));
        }*/
        for(int value : valueList){
            //変数valueにvalueListすべての要素を格納する
            System.out.println(value);
        }
}

    public static void main(String[] args) {
        logger.info(Mark.START.name());
        new TextReader(args[0]).execute();
        logger.info(Mark.END.name());
    }

}