; Define the template for job requirements
(deftemplate job-requirement
  (slot position)
  (slot education-level)
  (slot experience-years (type INTEGER))) ; Type constraint for experience-years

; Define the template for candidate information
(deftemplate candidate
  (slot name)
  (slot education-level (allowed-symbols bachelor master doctorate)) ; Allowed symbolic values for education-level
  (slot experience-years (type INTEGER))) ; Type constraint for experience-years

; Define the template for candidate status
(deftemplate candidate-status
  (slot name)
  (slot status))

; Define the job requirements fact
(deffacts job-requirements
  (job-requirement (position software-engineer)
                   (education-level bachelor)
                   (experience-years 5)))

; Rule to evaluate the candidate's qualification
(defrule evaluate-candidate-qualification
  (job-requirement (position software-engineer)
                   (education-level ?req-education)
                   (experience-years ?req-experience))
  (candidate (name ?name)
             (education-level ?level)
             (experience-years ?years))
  =>
  (if (and (eq ?level ?req-education) ; Check if education level matches the requirement
           (>= ?years ?req-experience)) ; Check if experience years meet the requirement
    then (assert (candidate-status (name ?name) (status qualified))) ; If both conditions are true, assert qualified status
    else (assert (candidate-status (name ?name) (status disqualified))))) ; Otherwise, assert disqualified status

; Rule to get candidate information from the user
(defrule get-candidate-info
  =>
  (printout t "Enter the candidate's name: ") ; Prompt for candidate's name
  (bind ?name (read)) ; Read and bind the candidate's name
  (printout t "Enter the candidate's education level (bachelor, master, or doctorate): ") ; Prompt for education level
  (bind ?education (read)) ; Read and bind the education level
  (printout t "Enter the candidate's years of relevant work experience: ") ; Prompt for work experience
  (bind ?experience (read)) ; Read and bind the work experience
  (assert (candidate (name ?name) (education-level ?education) (experience-years ?experience)))) ; Assert the candidate fact

; Rule to display the candidate's status
(defrule display-candidate-status
  (candidate-status (name ?name) (status ?status))
  =>
  (printout t "Candidate " ?name " is " ?status "." crlf)) ; Print the candidate's name and status

; Reset the CLIPS environment
(reset)

; Run the rules
(run)