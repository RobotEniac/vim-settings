#!/bin/sh

cp -r -f $HOME/.config/nvim/* ./
cp -r -f $HOME/.config/wezterm ./

# 1. 获取当前日期
TAG_NAME=$(date +%Y-%m-%d)

# 2. 检查 Git 状态
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "❌ 错误: 当前目录不是 Git 仓库。"
    exit 1
fi

# 3. 检查是否有未暂存或未提交的更改
if [ -z "$(git status --porcelain)" ]; then
    echo "ℹ️  提示: 没有检测到代码变更，无需提交。"
else
    # 有变更，进行提交
    echo "📝 发现变更，正在提交..."
    git add .
    git commit -m "chore: automated backup/release for $TAG_NAME"
    
    # 推送代码到当前分支
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    echo "🚀 正在推送代码到分支: $CURRENT_BRANCH..."
    git push origin "$CURRENT_BRANCH"
fi

# 4. 处理 Tag
if git rev-parse "$TAG_NAME" >/dev/null 2>&1; then
    echo "⚠️  提示: Tag '$TAG_NAME' 已经存在，跳过打标签步骤。"
else
    echo "🏷️  正在创建并推送标签: $TAG_NAME..."
    git tag -a "$TAG_NAME" -m "Release $TAG_NAME"
    git push origin "$TAG_NAME"
    echo "✅ 任务完成！"
fi
