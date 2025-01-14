echo "Deleting old publication"
rm -rf public
mkdir public
git worktree prune
rm -rf .git/worktrees/public/

echo "Checking out gh-pages branch into public"
git worktree add -B gh-pages public origin/gh-pages

echo "Removing existing files"
rm -rf public/*

echo "Generating site"
"e:\downloads\hugo_0.73.0_Windows-64bit\hugo.exe"

echo "Updating gh-pages branch"
cd public && git pull && git add --all && git commit -m "Publishing to gh-pages"
cd ..
echo "Pushing to github"
git push origin gh-pages