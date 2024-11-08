package com.example.backend;

import java.time.LocalDate;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.backend.entity.Initiative;
import com.example.backend.entity.Jonogon;
import com.example.backend.services.InitiativeService;
import com.example.backend.services.JonogonService;

@SpringBootApplication
public class BackendApplication implements CommandLineRunner {

	@Autowired
	JonogonService jonogonService;
	@Autowired
	InitiativeService initiativeService;

	public static void main(String[] args) {
		SpringApplication.run(BackendApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		Set<String> skills = Set.of("Programming", "Logistics", "Leadership");
		Jonogon[] jonogons = new Jonogon[] {
				new Jonogon("Saimun", "Saifullah Saimun", "01500000000", "password", LocalDate.now(), skills,
						"https://media.istockphoto.com/id/1388649939/photo/cheerful-caucasian-young-man-student-freelancer-using-digital-tablet-for-social-media-e.jpg?s=612x612&w=0&k=20&c=CJNskPIPv53TRKnOpiMBvFSLmDA-iELJ7vpbVASBdVo="),
				new Jonogon("Zarif", "Zarif Muhtasim", "01900000000", "password", LocalDate.now(), skills,
						"https://miro.medium.com/v2/resize:fit:1400/1*yKX-JDve35qQAI2OKHjHlw.jpeg"),
				new Jonogon("Adid", "Adid Rahman", "01800000000", "password", LocalDate.now(), skills,
						"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShw9JaVvcd6v8VA9hkzjIib-RL8Fpx5FEOOX6bDEBX33JIuO0ETz-LwmLmwnk-TkQ4ySM&usqp=CAU"),
		};
		for (Jonogon jonogon : jonogons) {
			jonogonService.save(jonogon);
		}

		Initiative[] initiatives = new Initiative[] {
				new Initiative("River Cleanup", "Organize a community river cleanup event", LocalDate.now(),
						"https://preview.redd.it/cleaning-work-of-mirpurs-paris-canal-by-bd-clean-volunteers-v0-s37npzoce6gc1.jpg?width=640&crop=smart&auto=webp&s=5ff663db629d1e9aca4e4ee20c41588eb4ba20d1",
						jonogons[0]),
				new Initiative("Tree Plantation", "Plant trees in the local park", LocalDate.now(),
						"https://ius-sdb.com/wp-content/uploads/2023/07/IND-dbcPune-001-1.jpg", jonogons[1]),
				new Initiative("Food Drive", "Collect and distribute food to the needy", LocalDate.now(),
						"https://cdn.assunnahfoundation.org/home/slide-00002.jpg", jonogons[2])
		};

		for (Initiative initiative : initiatives) {
			initiativeService.save(initiative);
		}

	}

}
