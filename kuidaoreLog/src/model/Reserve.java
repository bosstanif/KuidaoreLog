package model;

import java.io.Serializable;

public class Reserve implements Serializable {
		private String[] resHoliday;

		public Reserve() {
		}

		public Reserve(String[] resHoliday) {
			this.resHoliday = resHoliday;
		}

		public String[] getResHoliday() {
			return resHoliday;
		}
	}
