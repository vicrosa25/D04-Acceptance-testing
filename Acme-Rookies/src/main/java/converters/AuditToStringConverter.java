
package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.Audit;

@Component
@Transactional
public class AuditToStringConverter implements Converter<Audit, String> {

	@Override
	public String convert(final Audit Audit) {
		String result;
		if (Audit == null)
			result = null;
		else
			result = String.valueOf(Audit.getId());
		return result;
	}

}
