
package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import domain.Rookie;
import repositories.RookieRepository;

@Component
@Transactional
public class StringToRookieConverter implements Converter<String, Rookie> {

	@Autowired
	RookieRepository hackerRepository;


	@Override
	public Rookie convert(String text) {
		Rookie result;
		int id;

		try {
			if (StringUtils.isEmpty(text))
				result = null;
			else {
				id = Integer.valueOf(text);
				result = this.hackerRepository.findOne(id);
			}
		} catch (final Throwable oops) {
			throw new IllegalArgumentException(oops);
		}
		return result;
	}

}
