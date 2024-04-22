package racedata;
import java.util.concurrent.TimeUnit;

public class RaceData {
	public String eventType;
	public String gender;
	public String boatType;
	public String location;
	public String year;
	public String experience;
	public int time;
	public String formattedTime;
	public String rowersNames;
		
	public RaceData() {
	}
		
	public String getEventType() {
		return eventType;
	}
		
	public void setEventType(String eventType) {
		this.eventType = eventType;
	}
		
	public String getGender() {
		return gender;
	}
		
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getBoatType() {
		return boatType;
	}
		
	public void setBoatType(String boatType) {
		this.boatType = boatType;
	}
	
	public String getLocation() {
		return location;
	}
		
	public void setLocation(String location) {
		this.location = location;
	}
	
	public String getYear() {
		return year;
	}
		
	public void setYear(String year) {
		this.year = year;
	}
	
	public int getTime() {
		return time;
	}
		
	public void setTime (int time) {
		this.time= time;
	}
	
	public String getRowersNames() {
		return rowersNames;
	}
		
	public void setRowersNames(String names) {
		this.rowersNames= names;
	}
	
	public String getExperience() {
		return experience;
	}
		
	public void setExperience (String experience) {
		this.experience= experience;
	}

	public String getFormattedTime2() {

		long millis = Integer.parseInt(formattedTime);
		long hours = TimeUnit.MILLISECONDS.toHours(millis);
        millis -= TimeUnit.HOURS.toMillis(hours);
        long minutes = TimeUnit.MILLISECONDS.toMinutes(millis);
        millis -= TimeUnit.MINUTES.toMillis(minutes);
        
        //double m = millis /1000;
        
        long seconds = TimeUnit.MILLISECONDS.toSeconds(millis);
        millis -= TimeUnit.SECONDS.toMillis(seconds);
        double msec = millis;
        
        StringBuilder sb = new StringBuilder(64);
        
        sb.append(minutes);
        sb.append(":");
        
        if (seconds <10) {
        	sb.append("0");
        	sb.append(seconds);
        } else {
        	sb.append(seconds);
        }
        
        sb.append(".");
        sb.append((int)millis);
        
        
        //sb.append(".");
        //sb.append(msec);
        
        return(sb.toString());
	}
		
	public String getFormattedTime() {

		long millis = Integer.parseInt(formattedTime);
		long minutes = millis/(1000 *60);
		
        millis -= TimeUnit.MINUTES.toMillis(minutes);
        
        //double m = millis /1000;
        
        long seconds = TimeUnit.MILLISECONDS.toSeconds(millis);
        millis -= TimeUnit.SECONDS.toMillis(seconds);
        double msec = millis;
        
        StringBuilder sb = new StringBuilder(64);
        
        sb.append(minutes);
        sb.append(":");
        
        if (seconds <10) {
        	sb.append("0");
        	sb.append(seconds);
        } else {
        	sb.append(seconds);
        }
        
        sb.append(".");
        sb.append((int)millis);
        
        
        //sb.append(".");
        //sb.append(msec);
        
        return(sb.toString());
	}

	
	public void setFormattedTime(String names) {
		this.formattedTime= names;
	}
}
