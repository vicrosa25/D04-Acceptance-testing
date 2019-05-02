
package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import repositories.AuditorRepository;

@Service
@Transactional
public class AuditService {

	// Manage Repository
	@Autowired
	private AuditorRepository		auditorRepository;

	// Supporting services


	// CRUD methods

	/********************************************************************/
	// Other business methods

}
