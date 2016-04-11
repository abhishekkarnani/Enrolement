json.array!(@applicants) do |applicant|
  json.extract! applicant, :id, :name, :fname, :address, :dob, :contact, :edu, :comment
  json.url applicant_url(applicant, format: :json)
end
