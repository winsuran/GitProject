package wts.myplan.Util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DatesCal {

	public int numberOfWeekDays, numberOfWeekendDays;

	public DatesCal(String startDate,String endDate) {		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date date1 = df.parse(startDate);
			Date date2 = df.parse(endDate);
			Calendar cal1 = Calendar.getInstance();
			Calendar cal2 = Calendar.getInstance();
			cal1.setTime(date1);
			cal2.setTime(date2);			
			while (!cal1.after(cal2)) {
				if ((Calendar.SATURDAY != cal1.get(Calendar.DAY_OF_WEEK))
						&& (Calendar.SUNDAY != cal1.get(Calendar.DAY_OF_WEEK))) {
					numberOfWeekDays++;
					cal1.add(Calendar.DATE, 1);
				} else {
					numberOfWeekendDays++;
					cal1.add(Calendar.DATE, 1);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
