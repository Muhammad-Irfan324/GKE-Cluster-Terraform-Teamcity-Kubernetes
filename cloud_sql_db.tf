# AUTHOR - MUHAMMAD IRFAN TAHIR

resource "google_sql_database" "database" {
  name = "addoptify-teamcity-sql-database"
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_database_instance" "instance" {
  name = "addoptify-teamcity-sql-database-instance"
  region = "europe-west2"
  
  settings {
    tier = "db-n1-standard-1"
    #zone = var.location_zone
    availability_type = "ZONAL"
    disk_size = 10
    disk_type = "PD_SSD"
    ip_configuration {
	ipv4_enabled = false
      private_network = google_compute_network.vpc_network.id 
    }
    location_preference {
      zone = var.location_zone
    }
  }
database_version = "MYSQL_8_0"
}
