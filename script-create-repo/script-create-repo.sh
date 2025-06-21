# envs 
repo_name="${1}"
org_name="${2}"
token_gh="${3}"
template="${4}"


# create repo
gh repo create ${org_name}/${repo_name} --public --template ${org_name}/${template} --include-all-branches 

# create ruleset
curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${token_gh}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/${org_name}/${repo_name}/rulesets \
  -d '
    {
    "name": "branch-ruleset",
    "target": "branch",
    "enforcement": "active",
    "conditions": {
        "ref_name": {
        "exclude": [],
        "include": [
            "~DEFAULT_BRANCH",
            "refs/heads/develop"
        ]
        }
    },
    "rules": [
        {
        "type": "deletion"
        },
        {
        "type": "non_fast_forward"
        },
        {
        "type": "pull_request",
        "parameters": {
            "required_approving_review_count": 1,
            "dismiss_stale_reviews_on_push": false,
            "require_code_owner_review": true,
            "require_last_push_approval": false,
            "required_review_thread_resolution": true,
            "automatic_copilot_code_review_enabled": true,
            "allowed_merge_methods": [
            "merge"
            ]
        }
        }
    ],
    "bypass_actors": []
    }'
