sudo docker-compose run web analyze $1 --no-server --no-banner
sudo su postgres -c "psql -d gitrob -t -A -F\",\" -c \"select flags.blob_id, flags.caption, blobs.path, repositories.html_url FROM flags INNER JOIN owners ON flags.assessment_id = owners.assessment_id AND owners.login = '$1' inner join blobs on blobs.id = flags.blob_id inner join repositories on blobs.repository_id = repositories.id;\" > /tmp/$1.csv"
sudo mv /tmp/$1.csv ./$1.csv
# A saida .csv está do tipo: [id_do_arquivo],[motivo_do_flag],[caminho_do_arquivo_no_rep],[url_do_repositorio] 
