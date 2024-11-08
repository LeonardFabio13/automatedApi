package resourse.features;

import com.intuit.karate.junit5.Karate;

public class apiPetStore {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("apiPetStore").relativeTo(getClass());
    }
}
