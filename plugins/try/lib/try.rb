module Try
	HOURS_BY_DAY = 8.0
	VALID_HOURS_BY_DAY = [4.0, 8.0, 12.0, 16.0]
	CALCULATE_END_DATE = false
	
	class << self

		def setup
			
			#Issue.safe_attributes 'percentage'
		end
	
		def calculate_end_date
			if Setting.plugin_try['end_time'].nil?
				CALCULATE_END_DATE
			else
				if Setting.plugin_try['end_time'] == '1'
					true
				else
					false
				end
			end
		end
		
		def hour_by_day
			if Setting.plugin_try['h_b_d']
				by_settigns = Setting.plugin_try['h_b_d'].to_d
				if VALID_HOURS_BY_DAY.include?(by_settigns)
					by_settigns
				else
					HOURS_BY_DAY
				end
			else
				HOURS_BY_DAY
			end
		end
		
		def hollidays
			if Setting.plugin_try['hollidays']
				Setting.plugin_try['hollidays']
			else
				""
			end
		end
		
		def get_hollidays
			if Setting.plugin_try['hollidays']
				Setting.plugin_try['hollidays'].split(",").sort
			else
				[]
			end
		end
		
		def get_hollidays_js
			if Setting.plugin_try['hollidays']
				Setting.plugin_try['hollidays'].split(",").sort.to_json
			else
				[]
			end
		end
	end
end