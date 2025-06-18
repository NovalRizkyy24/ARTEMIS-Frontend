# Gunakan image Nginx yang sangat ringan (Alpine) sebagai base image
FROM nginx:alpine

# Hapus konfigurasi Nginx default
# Ini opsional, tapi bagus untuk memastikan konfigurasi kita bersih
RUN rm /etc/nginx/conf.d/default.conf

# Salin seluruh isi folder 'public' ke direktori Nginx untuk menyajikan file HTML
# '/usr/share/nginx/html' adalah lokasi default Nginx menyajikan file
COPY public /usr/share/nginx/html

# Opsional: Jika Anda memiliki konfigurasi Nginx kustom di root proyek Frontend Anda
# (misalnya, untuk custom error pages atau rewrites SPA)
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80 untuk akses web
EXPOSE 80

# Perintah yang akan dijalankan ketika container dimulai
# Nginx akan berjalan di latar belakang
CMD ["nginx", "-g", "daemon off;"]