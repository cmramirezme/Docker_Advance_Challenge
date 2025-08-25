-- Table to store all user songs
CREATE TABLE IF NOT EXISTS merged_songs (
    id SERIAL PRIMARY KEY,
    user_id VARCHAR(100) NOT NULL,
    song_name VARCHAR(255) NOT NULL,
    artist_name VARCHAR(255) NOT NULL,
    popularity INT DEFAULT 0,
    votes INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Table to store top 20 songs (generated in /playlist)
CREATE TABLE IF NOT EXISTS top_songs (
    id SERIAL PRIMARY KEY,
    user_id VARCHAR(100) NOT NULL,
    song_name VARCHAR(255) NOT NULL,
    artist_name VARCHAR(255) NOT NULL,
    popularity INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Auto-update updated_at column on changes in merged_songs
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
   NEW.updated_at = NOW();
   RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_merged_songs_updated_at
BEFORE UPDATE ON merged_songs
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();
