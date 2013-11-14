class VerticalResponse
  
  def initialize(row)
    @raw_data = row
    @created_date = row[3]
    @email = row[0]
    @prefix = row[18]
    @first_name = row[1]
    @last_name = row[2]
    @suffix = ""
    @address_1 = row[6]
    @address_2 = row[7]
    @city = row[8]
    @state = row[9]
    @postal_code = row[10]
    @country = row[11]
    @phone = row[12]
    @school = row[5]
    @job_title = row[4]
    @job_function = determine_job_function(row)
    @school_district = ""
    @type_of_school = determine_school(row)
    @primary_subject = determine_subject(row)
    @primary_grade_level = determine_grade(row)
  end
  
  def to_row
    [
      @created_date,
      @email,
      @prefix,
      @first_name,
      @middle_name,
      @last_name,
      @suffix,
      @address_1,
      @address_2,
      @city,
      @state,
      @postal_code,
      @country,
      @phone,
      @school,
      @job_title,
      @job_function,
      @school_district,
      @type_of_school,
      @primary_subject,
      @primary_grade_level
    ]
  end
  
  def to_s
    to_row.join(',')
  end
  
  def determine_grade(row)
    grades = []
    grades << "9-12" if row[27] == 'yes'
    grades << "6-8" if row[21] == 'yes'
    grades << "3-5" if row[22] == 'yes'
    grades << "K-2" if row[24] == 'yes'
    return grades.first if grades.length > 0
  end
  
  def determine_school(row)
    return ""
  end
  
  def determine_job_function(row)
    return "" if row[4].nil?
    return "Teacher/Professor" if row[20] == "yes"
    return "Teacher Leader/Dept. Chair" if row[35] == "yes"
    return "Teacher/Professor" if row[4].downcase.include?('teacher')
    return "District Administration" if row[4].downcase.include?('district')
    return "Teacher/Professor" if row[4].downcase.include?('professor')
    return "Teacher/Professor" if row[4].downcase.include?('instructor')
    return "Teacher/Professor" if row[4].downcase.include?('educator')
    return "Teacher/Professor" if row[4].downcase.include?('doctoral')
    return "Teacher/Professor" if row[4].downcase.include?('doctoral')
    return "Teacher Leader/Dept. Chair" if row[4].downcase.include?('coach')
    return "Principal/Assistant Principal" if row[4].downcase.include?('principal')
    return "District Administration" if row[4].downcase.include?('superindendent')
    return "Industry Professional" if row[4].downcase.include?('director')
    return "Industry Professional" if row[4].downcase.include?('manager')
    return "Industry Professional" if row[4].downcase.include?('president')
    return "Industry Professional" if row[4].downcase.include?('chairman')
    return "Industry Professional" if row[4].downcase.include?('chairperson')
    return "Industry Professional" if row[4].downcase.include?('consultant')
    return "Industry Professional" if row[4].downcase.include?('manager')
    return "Industry Professional" if row[4].downcase.include?('ceo')
    return "Industry Professional" if row[4].downcase.include?('cio')
    return "Industry Professional" if row[4].downcase.include?('cfo')
    return "Industry Professional" if row[4].downcase.include?('vp')
    return "Industry Professional" if row[4].downcase.include?('executive')
    return ""
  end
  
  def determine_subject(row)
    return "Economics" if row[30] == "yes"
    return "Personal Finance" if row[52] == "yes" || row[54] == "yes"
    return "Math" if row[42] == "yes"
    return "Social Studies" if row[28] == "yes"
    return "Social Studies" if row[39] == "yes"
    return "Social Studies" if row[38] == "yes"
    return "Social Studies" if row[32] == "yes"
    return "Social Studies" if row[47] == "yes"
    return "Social Studies" if row[46] == "yes"
    return "Social Studies" if row[48] == "yes"
    return ""
  end
  
end