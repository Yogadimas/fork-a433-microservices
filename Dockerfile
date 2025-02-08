# Menggunakan Node.js versi 16 sebagai base image
FROM node:16

# Set working directory
WORKDIR /app

# Copy package.json dan package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy semua source code ke dalam container
COPY . .

# Set environment variables (optional)
ENV PORT=3000

# Expose port
EXPOSE 3000

# Jalankan aplikasi
CMD ["npm", "start"]
