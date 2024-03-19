import sys

conf_file = "/var/www/html/wp-config.php"


def main():
    if len(sys.argv) < 5:
        print(
            "Usage: python3 gen_cred_file.py <access_key> <secret_key> <bucket_name> <region>"
        )
        sys.exit(1)
    db_host = sys.argv[1]
    db_name = sys.argv[2]
    db_user = sys.argv[3]
    db_pass = sys.argv[4]
    access_key = sys.argv[5]
    secret_key = sys.argv[6]
    bucket_name = sys.argv[7]
    region = sys.argv[8]
    contents = ""
    with open(conf_file, "r") as f:
        lines = f.readlines()
        for line in lines:
            contents += line
            if "define( 'WP_DEBUG', false );" in line:
                contents += f"define( 'AS3CF_SETTINGS', serialize( array (\n"
                contents += f"  'provider' => 'aws',\n"
                contents += f"  'access-key-id' => '{access_key}',\n"
                contents += f"  'secret-access-key' => '{secret_key}',\n"
                contents += f"  'bucket' => '{bucket_name}',\n"
                contents += f"  'region' => '{region}',\n"
                contents += f"  'copy-to-s3' => true,\n"
                contents += f"  'serve-from-s3' => true,\n"
                contents += f") ) );\n"

    contents = contents.replace("'DB_HOST', 'localhost'", f"'DB_HOST', '{db_host}'")
    contents = contents.replace(
        "'DB_NAME', 'database_name_here'", f"'DB_NAME', '{db_name}'"
    )
    contents = contents.replace("'DB_USER', 'username_here'", f"'DB_USER', '{db_user}'")
    contents = contents.replace(
        "'DB_PASSWORD', 'password_here'", f"'DB_PASSWORD', '{db_pass}'"
    )

    with open(conf_file, "w") as f:
        f.write(contents)


if __name__ == "__main__":
    main()
