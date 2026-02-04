export default function Home() {
  return (
    <main className="container">
      <div className="hero">
        <h1>Welcome to Domislink Empire</h1>
        <p className="subtitle">Your gateway to excellence</p>
      </div>
      
      <section className="features">
        <div className="feature-card">
          <h2>🚀 Fast & Reliable</h2>
          <p>Built with Next.js for optimal performance</p>
        </div>
        <div className="feature-card">
          <h2>🎨 Modern Design</h2>
          <p>Clean and responsive user interface</p>
        </div>
        <div className="feature-card">
          <h2>📱 Mobile Ready</h2>
          <p>Works seamlessly on all devices</p>
        </div>
      </section>

      <section className="cta">
        <h2>Get Started Today</h2>
        <p>Join the Domislink Empire community</p>
        <a href="/about" className="button">Learn More</a>
      </section>
    </main>
  )
}
