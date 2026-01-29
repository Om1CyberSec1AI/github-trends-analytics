PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS repositories (
  id INTEGER PRIMARY KEY,
  full_name TEXT NOT NULL UNIQUE,
  name TEXT NOT NULL,
  owner_login TEXT NOT NULL,
  description TEXT,
  html_url TEXT,
  language TEXT,
  stargazers_count INTEGER NOT NULL DEFAULT 0,
  forks_count INTEGER NOT NULL DEFAULT 0,
  open_issues_count INTEGER NOT NULL DEFAULT 0,
  watchers_count INTEGER NOT NULL DEFAULT 0,
  license_name TEXT,
  created_at TEXT,
  updated_at TEXT,
  pushed_at TEXT
);

CREATE TABLE IF NOT EXISTS repo_languages (
  repo_id INTEGER NOT NULL,
  language TEXT NOT NULL,
  bytes INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (repo_id, language),
  FOREIGN KEY (repo_id) REFERENCES repositories(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS contributors (
  repo_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  login TEXT NOT NULL,
  contributions INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (repo_id, user_id),
  FOREIGN KEY (repo_id) REFERENCES repositories(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS commits (
  sha TEXT PRIMARY KEY,
  repo_id INTEGER NOT NULL,
  author_login TEXT,
  author_id INTEGER,
  commit_date TEXT NOT NULL,
  message TEXT,
  FOREIGN KEY (repo_id) REFERENCES repositories(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS issues (
  id INTEGER PRIMARY KEY,
  repo_id INTEGER NOT NULL,
  number INTEGER NOT NULL,
  title TEXT NOT NULL,
  state TEXT NOT NULL,
  is_pull_request INTEGER NOT NULL DEFAULT 0,
  author_login TEXT,
  comments INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL,
  closed_at TEXT,
  labels_json TEXT,
  FOREIGN KEY (repo_id) REFERENCES repositories(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_issues_repo_state ON issues(repo_id, state);
CREATE INDEX IF NOT EXISTS idx_commits_repo_date ON commits(repo_id, commit_date);

CREATE TABLE IF NOT EXISTS stars (
  repo_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  login TEXT,
  starred_at TEXT NOT NULL,
  PRIMARY KEY (repo_id, user_id),
  FOREIGN KEY (repo_id) REFERENCES repositories(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_stars_repo_time ON stars(repo_id, starred_at);
