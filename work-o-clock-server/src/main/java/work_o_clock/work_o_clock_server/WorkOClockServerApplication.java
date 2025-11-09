package work_o_clock.work_o_clock_server;


import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
public class WorkOClockServerApplication {

    private static final Logger logger = LoggerFactory.getLogger(WorkOClockServerApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(WorkOClockServerApplication.class, args);
    }
    
    

    /**
     *
     */
    @EventListener(ApplicationReadyEvent.class)
    public void onApplicationReady() {
        logger.info("✅ Work O'Clock Server iniciado correctamente.");
        logger.info("🌐 API disponible en: http://localhost:8080");
        logger.info("📘 Documentación Swagger: http://localhost:8080/swagger-ui/index.html");

    }
}
