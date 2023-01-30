public class Person {
    public enum Gender {
        female, male
    };

    private Gender gender;

    public Person(Gender gender) {
        this.gender = gender;
    }

    public void speak() {
        switch (gender) {
            case female:
                System.out.println("I'm a woman");
                break;
            case male:
                System.out.println("I'm a man");
                break;
            default:
        }
    }

    public static void main(String[] args) {
        Person p1 = new Person(Gender.female);
        p1.speak();

        Person p2 = new Person(Gender.male);
        p2.speak();
    }
}
