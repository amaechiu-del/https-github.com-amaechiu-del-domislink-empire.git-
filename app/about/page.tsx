export default function About() {
  return (
    <div className="about-container">
      <div className="about-header">
        <h1>About Domislink Empire</h1>
      </div>
      
      <div className="about-content">
        <p>
          Welcome to Domislink Empire, a modern web platform built with cutting-edge technologies
          to provide the best user experience.
        </p>
        
        <h2>Our Mission</h2>
        <p>
          We strive to deliver exceptional digital experiences that empower our users and 
          help them achieve their goals. Our platform is designed with performance, 
          accessibility, and user satisfaction in mind.
        </p>
        
        <h2>Technology Stack</h2>
        <p>
          Built with Next.js 14, React 18, and TypeScript, our application leverages 
          the latest web technologies to ensure fast loading times, smooth interactions, 
          and a responsive design that works beautifully on all devices.
        </p>
        
        <h2>Deployment</h2>
        <p>
          This application is deployed using GitHub Pages with automated CI/CD pipelines,
          ensuring that every update is tested and deployed seamlessly.
        </p>
        
        <a href="/" className="back-link">← Back to Home</a>
      </div>
    </div>
  )
}
