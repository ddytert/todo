package config

type Config struct {
	DB   *DBConfig
	Auth *AuthConfig
	Port uint
}

type DBConfig struct {
	DSN string
}

type AuthConfig struct {
	JWTSecret    string
	JWTIssuer    string
	JWTAudience  string
	CookieDomain string
	Domain       string
}

func GetConfig() *Config {
	return &Config{
		DB: &DBConfig{
			DSN: "host=localhost port=5432 user=postgres password=postgres dbname=todo sslmode=disable timezone=UTC connect_timeout=5",
		},
		Auth: &AuthConfig{
			JWTSecret:    "verysecret",
			JWTIssuer:    "example.com",
			JWTAudience:  "example.com",
			CookieDomain: "localhost",
			Domain:       "example.com",
		},
		Port: 8080,
	}
}
