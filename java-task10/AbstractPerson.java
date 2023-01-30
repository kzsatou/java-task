public abstract class AbstractPerson {

    //抽象メソッドを宣言
    abstract String getGender();

    public void speak(){
        System.out.println("I'm a " + getGender());
    }
}
