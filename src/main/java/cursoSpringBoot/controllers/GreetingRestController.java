package cursoSpringBoot.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.Objects;

@RestController
public class GreetingRestController {

    @GetMapping("/saludo/{name}")
    public String greeting(@PathVariable String name){

        if(Objects.equals(name.toUpperCase(), "OMAR")){
            return "Hola pendejo estúpido idiota";

        } else if (Objects.equals(name.toUpperCase(), "BRYAN")) {
            return "Hola pinche agropecuario sin derechos";
        } else{
            String invertida = String.valueOf(new StringBuilder(name).reverse());
            System.out.println(invertida);
        return "Hola " + name;
    }
    }

}
