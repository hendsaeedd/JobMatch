# JobMatch

This is a simple job matching system implemented in CLIPS. It matches job requirements with candidate qualifications to determine if a candidate is qualified for a given position.

## Domain

Human resources

## Objective

Assist in the job candidate screening and selection process

## Knowledge Base

Rules and facts about job requirements, candidate qualifications, and hiring criteria

## Example Rule

"If the candidate has the required educational background and at least 5 years of relevant work experience, then the system should recommend the candidate for further consideration."

## Features

- Define job requirements including position, education level, and experience years.
- Input candidate information such as name, education level, and experience years.
- Evaluate candidates against job requirements to determine qualification status.
- Display the qualification status of each candidate.

## Usage

To use the Job Matching System:

1. Ensure you have CLIPS (C Language Integrated Production System) installed on your system.
2. Clone this repository to your local machine.
3. Open the CLIPS environment or run the CLIPS executable.
4. Load the project file (`main.clp`).
5. Assert job requirements and candidate information using CLIPS commands or modify the provided `deffacts` sections in the project file.
6. Run the rules engine using the `(reset)` then `(run)` commands.
7. View the qualification status of each candidate.
