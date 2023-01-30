public class GenderSpeaker {
    public static void main(String[] args) {
        Man p1 = new Man();
        Woman p2 = new Woman();

        /*
         * doSpeak(new Man());
         * doSpeak(new Woman());
         * }
         * 
         * private static void doSpeak(AbstractPerson person) {
         * person.speak();
         * }
         */

        // 回答案
        p1.speak();
        p2.speak();
    }
}
