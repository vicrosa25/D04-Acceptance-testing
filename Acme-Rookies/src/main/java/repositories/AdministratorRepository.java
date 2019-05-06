
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Administrator;
import domain.Company;
import domain.Position;
import domain.Provider;
import domain.Rookie;

@Repository
public interface AdministratorRepository extends JpaRepository<Administrator, Integer> {

	@Query("select admin from Administrator admin where admin.userAccount.id = ?1")
	Administrator findByUserAccountId(int id);

	// Queries level C
	@Query("select avg(c.positions.size), min(c.positions.size), max(c.positions.size), stddev(c.positions.size) from Company c")
	Object[] query1();

	@Query("select avg(h.applications.size), min(h.applications.size), max(h.applications.size), stddev(h.applications.size) from Rookie h")
	Object[] query2();

	@Query("select c1 from Company c1 where c1.positions.size = (Select max(c2.positions.size) from Company c2)")
	Collection<Company> query3();

	@Query("select h1 from Rookie h1 where h1.applications.size = (Select max(h2.applications.size) from Rookie h2)")
	Collection<Rookie> query4();

	@Query("select avg(p.salary), min(p.salary), max(p.salary), stddev(p.salary) from Position p")
	Object[] query5();

	@Query("select p1 from Position p1 where p1.salary = (Select max(p2.salary) from Position p2)")
	Collection<Position> query6a();

	@Query("select p1 from Position p1 where p1.salary = (Select min(p2.salary) from Position p2)")
	Collection<Position> query6b();

	// Queries level B
	@Query("select avg(h.curriculas.size), min(h.curriculas.size), max(h.curriculas.size), stddev(h.curriculas.size) from Rookie h")
	Object[] query7();

	@Query("select avg(f.positions.size), min(f.positions.size), max(f.positions.size), stddev(f.positions.size) from Finder f")
	Object[] query8();

	@Query("select count(f)*1.0 / (select count(f1)*1.0 from Finder f1 where f1.positions.size > 0) from Finder f where f.positions.size = 0")
	Double query9();

	/** ACME ROOKIE **/

	// Leve C
	@Query("select avg(a.score), min(a.score), max(a.score), stddev(a.score) from Position p join p.audits a")
	Object[] query10();

	@Query("select avg(c.score), min(c.score), max(c.score), stddev(c.score) from Company c")
	Object[] query11();

	@Query("select c from Company c where c.score = (select max(c1.score) from Company c1)")
	Collection<Company> query12();

	@Query("select avg(p.salary) from Position p join p.audits a where a.score = (select max(a.score) from Position p join p.audits a)")
	Double query13();

	// Level B
	@Query("select avg(p.items.size), min(p.items.size), max(p.items.size), stddev(p.items.size) from Provider p")
	Object[] query14();

	@Query("select p from Provider p group by p order by p.items.size desc")
	Collection<Provider> query15();

	// Level A
	@Query("select avg(p.sponsorships.size), min(p.sponsorships.size), max(p.sponsorships.size), stddev(p.sponsorships.size) from Provider p")
	Object[] query16();

	@Query("select avg(p.sponsorships.size), min(p.sponsorships.size), max(p.sponsorships.size), stddev(p.sponsorships.size) from Position p")
	Object[] query17();
	
	@Query("select p from Provider p where p.sponsorships.size > (select avg(p1.sponsorships.size) from Provider p1)")
	Collection<Provider> query18();

}
