-- Table: dim_skills
CREATE TABLE dim_skills (
    skill_id SERIAL PRIMARY KEY,
    phase VARCHAR(50),
    category VARCHAR(100),
    parent_skill_id INT REFERENCES dim_skills(skill_id),
    skill_name VARCHAR(255) NOT NULL,
    type VARCHAR(50),
    priority VARCHAR(50),
    difficulty VARCHAR(50),
    notes TEXT,
    prerequisites VARCHAR(255)
);

-- Table: dim_users
CREATE TABLE dim_users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: fact_skill_progress
CREATE TABLE fact_skill_progress (
    tracker_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES dim_users(user_id),
    skill_id INT REFERENCES dim_skills(skill_id),
    status VARCHAR(50),
    progress_pct INT CHECK (progress_pct >= 0 AND progress_pct <= 100),
    start_date DATE,
    end_date DATE,
    notes TEXT
);