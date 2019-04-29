
package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.Rookie;

@Component
@Transactional
public class RookieToStringConverter implements Converter<Rookie, String> {

	@Override
	public String convert(Rookie hacker) {
		String result;
		if (hacker == null)
			result = null;
		else
			result = String.valueOf(hacker.getId());
		return result;
	}

}
