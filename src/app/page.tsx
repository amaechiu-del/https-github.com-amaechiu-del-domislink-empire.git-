export default function Home() {
  return (
    <main className="flex flex-1 flex-col items-center justify-center min-h-screen bg-zinc-50 dark:bg-zinc-950 px-6">
      <div className="max-w-2xl w-full text-center">
        <h1 className="text-5xl font-bold tracking-tight text-zinc-900 dark:text-zinc-50 mb-4">
          Domislink Empire
        </h1>
        <p className="text-xl text-zinc-600 dark:text-zinc-400 mb-8">
          Your vision. Built with modern web technology.
        </p>
        <div className="flex flex-col sm:flex-row gap-4 justify-center">
          <a
            href="https://nextjs.org/docs"
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center justify-center h-12 px-6 rounded-full bg-zinc-900 text-white text-sm font-medium transition-colors hover:bg-zinc-700 dark:bg-zinc-50 dark:text-zinc-900 dark:hover:bg-zinc-200"
          >
            Next.js Docs
          </a>
          <a
            href="https://github.com/amaechiu-del/https-github.com-amaechiu-del-domislink-empire.git-"
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center justify-center h-12 px-6 rounded-full border border-zinc-200 text-zinc-800 text-sm font-medium transition-colors hover:bg-zinc-100 dark:border-zinc-700 dark:text-zinc-200 dark:hover:bg-zinc-800"
          >
            View on GitHub
          </a>
        </div>
      </div>
    </main>
  );
}
