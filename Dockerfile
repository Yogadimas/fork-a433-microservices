# Menggunakan Node.js versi 16 sebagai base image
# Menetapkan image dasar yang digunakan untuk membangun container, dalam hal ini adalah Node.js versi 16.
FROM node:16  

# Set working directory
# Menetapkan direktori kerja di dalam container ke '/app', di mana semua perintah berikutnya akan dijalankan.
WORKDIR /app  

# Copy package.json dan package-lock.json
# Menyalin file package.json dan package-lock.json ke dalam direktori kerja di dalam container.
COPY package*.json ./  

# Install dependencies
# Menjalankan perintah npm install untuk menginstal semua dependensi yang terdaftar di package.json.
RUN npm install  

# Copy semua source code ke dalam container
# Menyalin semua file dan folder dari direktori lokal ke dalam direktori kerja di dalam container.
COPY . .  

# Set environment variables (optional)
# Menetapkan variabel lingkungan PORT dengan nilai 3001, yang dapat digunakan oleh aplikasi.
ENV PORT=3001  

# Expose port
# Menginformasikan bahwa container akan mendengarkan pada port 3001 saat dijalankan.
EXPOSE 3001 

# Jalankan aplikasi
# Menentukan perintah yang akan dijalankan saat container dimulai, dalam hal ini menjalankan aplikasi Node.js menggunakan npm start.
CMD ["npm", "start"]  