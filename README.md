Учебная проектная работа №7 SkillFactory.
Задание:
1. Создать три виртуальные машины в Я.Облаке (одна будет мастером, две другие — рабочими нодами). Минимальные требования к ресурсам: 2vCPU, 2GB RAM, 20GB HDD.
2. Собрать из них Kubernetes-кластер.
3. Запустить на нем nginx, настроить его на прослушивание порта 8888.
4. Прислать ментору на проверку k8s-манифесты в YAML-формате.


main.tf - код для развертывания виртуалок в яндексе
kubernetes-setup/master-playbook.yml - ансибл-плейбук для разворачивания мастера
kubernetes-setup/node-playbook.yml - ансибл-плейбук для добавления рабочей ноды в кластер
kubernetes-setup/join-command - файл команды добавления рабочей ноды (генерится автоматически)
inventory - файл генерится автоматически
nginx-deployment.yaml - манифест для деплоя nginx
nginx-nodeport.yaml - манифест для поднятия сервиса проброса порта nginx
После разворачивания всего: kubectl describe services nginx-service отдаст информацию о сервисе NodePort, 
в одноименном поле которого есть номер порта, по которому будет доступна странице извне по адресу ноды.
kubectl port-forward -n default service/nginx-service 8888:80 - позволит открыть страницу nginx на локальной машине http://127.0.0.1:8888/
