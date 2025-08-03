log_file="access.log"
report_file="report.txt"

# Проверка существования лог-файла
if [[ ! -f "$log_file" ]]; then
  echo "Файл $log_file не найден!"
  exit 1
fi

# Подсчет общего количества запросов
total_requests=$(wc -l < "$log_file")

# Подсчет уникальных IP-адресов
unique_ips=$(awk '{print $1}' "$log_file" | sort | uniq | wc -l)

# Подсчет количества запросов по методам (GET, POST и т.д.)
method_counts=$(awk -F\" '{print $2}' "$log_file" | awk '{print $1}' | sort | uniq -c)

# Самый популярный URL
most_popular_url=$(awk -F\" '{print $2}' "$log_file" | awk '{print $2}' | sort | uniq -c | sort -nr | head -n>
# Создание отчета
{
echo "Отчет о логе веб-сервера"
