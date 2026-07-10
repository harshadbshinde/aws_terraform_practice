resource "aws_instance" "my_ec2" {
  ami                    = "ami-01a00762f46d584a1"
  instance_type          = "t2.micro"
  key_name               = "new"   

  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  user_data = <<-EOF
#!/bin/bash

apt update -y
apt install nginx -y

systemctl start nginx
systemctl enable nginx

cat > /var/www/html/index.html <<'HTML'
<!DOCTYPE html>
<html>
<head>
<title>Harshad Shinde - DevOps Engineer</title>

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg,#000000,#1a1a1a);
    color: white;
}

.hero {
    text-align: center;
    padding: 60px;
    transform-style: preserve-3d;
    animation: rotate3d 5s infinite alternate ease-in-out;
}

.hero h1 {
    font-size: 70px;
    color: cyan;
    text-shadow:
        2px 2px 0 #00bcd4,
        4px 4px 0 #0097a7,
        6px 6px 15px cyan;
    margin: 0;
}

.hero h2 {
    font-size: 35px;
    letter-spacing: 5px;
    color: white;
}

.section {
    width: 80%;
    margin: 20px auto;
    padding: 25px;
    border-radius: 10px;
    border: 1px solid cyan;
    background: rgba(255,255,255,0.05);
}

.section h3 {
    color: cyan;
}

.skills {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
}

.skill {
    padding: 10px 15px;
    border: 1px solid cyan;
    border-radius: 5px;
    background: #111;
}

footer {
    text-align: center;
    padding: 20px;
    margin-top: 30px;
    border-top: 1px solid cyan;
}

@keyframes rotate3d {
    from {
        transform: perspective(800px) rotateY(-15deg);
    }
    to {
        transform: perspective(800px) rotateY(15deg);
    }
}
</style>

</head>
<body>

<div class="hero">
    <h1>HARSHAD SHINDE</h1>
    <h2>DEVOPS ENGINEER</h2>
</div>

<div class="section">
    <h3>About Me</h3>
    <p>
        Passionate DevOps Engineer with knowledge of AWS, Linux,
        Terraform, Docker, Kubernetes, Jenkins and CI/CD pipelines.
        Interested in cloud infrastructure automation and deployment.
    </p>
</div>

<div class="section">
    <h3>Skills</h3>

    <div class="skills">
        <div class="skill">AWS Cloud</div>
        <div class="skill">Linux</div>
        <div class="skill">Terraform</div>
        <div class="skill">Docker</div>
        <div class="skill">Kubernetes</div>
        <div class="skill">Jenkins</div>
        <div class="skill">Git & GitHub</div>
        <div class="skill">Bash Scripting</div>
    </div>
</div>

<div class="section">
    <h3>Projects</h3>
    <ul>
        <li>Automated AWS Infrastructure using Terraform</li>
        <li>CI/CD Pipeline with Jenkins</li>
        <li>Dockerized Web Application Deployment</li>
        <li>Kubernetes Cluster Setup</li>
    </ul>
</div>

<div class="section">
    <h3>Contact</h3>
    <p>Email: harshad@example.com</p>
    <p>Phone: +91 XXXXX XXXXX</p>
</div>

<footer>
    © 2026 Harshad Shinde | DevOps Engineer
</footer>

</body>
</html>
HTML
EOF

  tags = {
    Name = "EC2-web-server"
  }
}

