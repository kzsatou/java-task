public class Man extends AbstractPerson {
    private String male = "man";

    //抽象メソッドをオーバーライド
    @Override
    String getGender() {
        return male;
    }
}
