log_file="access.log"
report_file="report.txt"

# �������� ������������� ���-�����
if [[ ! -f "$log_file" ]]; then
  echo "���� $log_file �� ������!"
  exit 1
fi

# ������� ������ ���������� ��������
total_requests=$(wc -l < "$log_file")

# ������� ���������� IP-�������
unique_ips=$(awk '{print $1}' "$log_file" | sort | uniq | wc -l)

# ������� ���������� �������� �� ������� (GET, POST � �.�.)
method_counts=$(awk -F\" '{print $2}' "$log_file" | awk '{print $1}' | sort | uniq -c)

# ����� ���������� URL
most_popular_url=$(awk -F\" '{print $2}' "$log_file" | awk '{print $2}' | sort | uniq -c | sort -nr | head -n>
# �������� ������
{
echo "����� � ���� ���-�������"