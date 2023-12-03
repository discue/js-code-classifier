#!/usr/bin/env bash

declare -r SCOPE_TRAINING='training'
declare -r SCOPE_TEST='test'

declare -A repo0=(
    [url]='https://github.com/jquery/jquery'
    [search]='src/**.js'
    [commit]='fb0cc272916dc909552a1b7bc1a39295e564d3a8'
    [scope]=$SCOPE_TRAINING
)
declare -A repo1=(
    [url]='https://github.com/Leaflet/Leaflet'
    [search]='src/**.js'
    [commit]='3d0d4b36cbbec7e1ae98dbf6f1a0b1db0237f227'
    [scope]=$SCOPE_TEST
)
declare -A repo2=(
    [url]='https://github.com/sveltejs/svelte'
    [search]='packages/svelte/src/**.js'
    [commit]='699c3379084b7e909728f8e0816be700f192085d'
    [scope]=$SCOPE_TRAINING
)
declare -A repo3=(
    [url]='https://github.com/mochajs/mocha'
    [search]='mocha/lib/**.js'
    [commit]='b41e98533aa0fb87d7ba61163254881607a8a8c5'
    [scope]=$SCOPE_TRAINING
)
declare -A repo4=(
    [url]='https://github.com/ramda/ramda'
    [search]='source/**.js'
    [commit]='ddd973612cdd0baab6b51a1766973c583ec6c750'
    [scope]=$SCOPE_TRAINING
)
declare -A repo5=(
    [url]='https://github.com/liriliri/licia'
    [search]='src/**.js'
    [commit]='cea6a77158eeb65ee271051dc347f142390741bc'
    [scope]=$SCOPE_TRAINING
)
declare -A repo6=(
    [url]='https://github.com/josdejong/mathjs'
    [search]='src/**.js'
    [commit]='347faa8f20cee1021ab63e733e2274d1c34432a1'
    [scope]=$SCOPE_TRAINING
)
declare -A repo7=(
    [url]='https://github.com/moment/moment'
    [search]='src/lib/**.js'
    [ignore]='*locale*'
    [commit]='000ac1800e620f770f4eb31b5ae908f6167b0ab2'
    [scope]=$SCOPE_TRAINING
)
declare -A repo8=(
    [url]='https://github.com/mout/mout'
    [search]='src/**.js'
    [commit]='f5a3623546a2d56e713bfbc902fbe808e66ae583'
    [scope]=$SCOPE_TRAINING
)
declare -A repo9=(
    [url]='https://github.com/hotwired/turbo'
    [search]='src/**.js'
    [commit]='cc263b4d89c4dda2c386d06b28954059dcbc730a'
    [scope]=$SCOPE_TRAINING
)
declare -A repo10=(
    [url]='https://github.com/meteor/meteor'
    [search]='package/**.js'
    [commit]='c9e3551b9673a7ed607f18cb1128563ff49ca96f'
    [scope]=$SCOPE_TRAINING
)
declare -A repo11=(
    [url]='https://github.com/Mevrael/bunny'
    [search]='src/**.js'
    [commit]='9a43dcb7b26ee6cfac3e9ac70439bb51e56e8a46'
    [scope]=$SCOPE_TRAINING
)
declare -A repo12=(
    [url]='https://github.com/jashkenas/underscore'
    [search]='modules/**.js'
    [commit]='0bd9b48c0ad58e55991a623477dc11fa0237ac87'
    [scope]=$SCOPE_TRAINING
)
declare -A repo13=(
    [url]='https://github.com/mrdoob/three.js'
    [search]='src/**.js'
    [commit]='4c5c68f4c690a73e8243e0d10c7cc3101dd0e084'
    [scope]=$SCOPE_TRAINING
)
declare -A repo14=(
    [url]='https://github.com/axios/axios'
    [search]='lib/**.js'
    [commit]='b3be36585884ba1e237fdd0eacf55f678aefc396'
    [scope]=$SCOPE_TRAINING
)
declare -A repo15=(
    [url]='https://github.com/gulpjs/gulp-cli'
    [search]='lib/**.js'
    [commit]='c9e9125c5e95b213dafb53cd9717c70bf66a47a9'
    [scope]=$SCOPE_TRAINING
)
declare -A repo16=(
    [url]='https://github.com/eslint/eslint'
    [search]='lib/**.js'
    [commit]='4a88a54aeb456abe94da9f5b3d5472d14b3116f1'
    [scope]=$SCOPE_TRAINING
)
declare -A repo17=(
    [url]='https://github.com/jshint/jshint'
    [search]='src/**.js'
    [commit]='0a5644f8f529e252e7dd0c0d54334ae435b13de0'
    [scope]=$SCOPE_TRAINING
)
declare -A repo18=(
    [url]='https://github.com/processing/p5.js'
    [search]='src/**.js'
    [commit]='fe9444879a817bb3d165da327cd8b04a78c6bfaf'
    [scope]=$SCOPE_TEST
)
declare -A repo19=(
    [url]='https://github.com/Crowducate/crowducate-platform'
    [search]='both/**.js'
    [commit]='b73f4b9179060fe03b5a9044f56edcf34d3595d1'
    [scope]=$SCOPE_TEST
)
declare -A repo20=(
    [url]='https://github.com/jsuites/jsuites'
    [search]='src/**.js'
    [commit]='e5c33d90cabaa0ad279085e00a319810e6fe100b'
    [scope]=$SCOPE_TRAINING
)
declare -A repo21=(
    [url]='https://github.com/jasongin/nvs'
    [search]='lib/**.js'
    [commit]='22ae0829b84624c49192112213d2556b9d42d99e'
    [scope]=$SCOPE_TRAINING
)
declare -A repo22=(
    [url]='https://github.com/OpenSTFoundation/openst-platform'
    [search]='lib/**.js'
    [commit]='2bcc62c7c7740b5f424fd9b467197aa14a94bb32'
    [scope]=$SCOPE_TEST
)
declare -A repo23=(
    [url]='https://github.com/okta/okta-sdk-nodejs'
    [search]='src/**.js'
    [commit]='895d48c9bf4e2e1d0d2fadcf0a84cc550e301851'
    [scope]=$SCOPE_TRAINING
)
declare -A repo24=(
    [url]='https://github.com/hakimel/reveal.js'
    [search]='js/**.js'
    [commit]='bbd0d3e4f73cf48a2062cacc4f7da3c25641c408'
    [scope]=$SCOPE_TRAINING
)
declare -A repo25=(
    [url]='https://github.com/SAP-archive/cloud-function-nodejs-samples'
    [search]='examples/**.js'
    [commit]='c28b9e1abd5dc142e7fae0e4d98f305312424052'
    [scope]=$SCOPE_TRAINING
)
declare -A repo26=(
    [url]='https://github.com/d3/d3-hierarchy'
    [search]='src/**.js'
    [commit]='563dd3a8f0465d72fce087adcb13bf1d6576e06f'
    [scope]=$SCOPE_TRAINING
)
declare -A repo27=(
    [url]='https://github.com/GoogleChromeLabs/sw-toolbox'
    [search]='lib/**.js'
    [commit]='2b234d9ba8a911cb4326492f5b57f5cc5a28d2fe'
    [scope]=$SCOPE_TRAINING
)
declare -A repo28=(
    [url]='https://github.com/hipache/hipache'
    [search]='lib/**.js'
    [commit]='395cedc49e04844bf93fc3a820e0c22c465eac15'
    [scope]=$SCOPE_TRAINING
)
declare -A repo29=(
    [url]='https://github.com/sockjs/sockjs-node'
    [search]='lib/**.js'
    [commit]='46d2f846653a91822a02794b852886c7f137378c'
    [scope]=$SCOPE_TRAINING
)
declare -A repo30=(
    [url]='https://github.com/sutoiku/formula.js'
    [search]='lib/**.js'
    [commit]='f52b7efd424036fdd708c9de3ac501f41d595d8c'
    [scope]=$SCOPE_TRAINING
)
declare -A repo31=(
    [url]='https://github.com/Flotype/now'
    [search]='lib/**.js'
    [commit]='957e7ac7f86ab60163dc5566653c186971f5ad09'
    [scope]=$SCOPE_TRAINING
)
declare -A repo32=(
    [url]='https://github.com/geddy/geddy'
    [search]='lib/**.js'
    [ignore]='! *log.js'
    [commit]='b967bcfd2763384404374da0e4487a81d42be830'
    [scope]=$SCOPE_TRAINING
)
declare -A repo33=(
    [url]='https://github.com/rendrjs/rendr'
    [search]='shared/**.js'
    [commit]='48560e1ca1ad72c94c9c68fb9cfba3259163536e'
    [scope]=$SCOPE_TRAINING
)
declare -A repo34=(
    [url]='https://github.com/kovacsv/JSModeler'
    [search]='src/**.js'
    [commit]='d082acc6fb5b56176ecdd10a4b21f5855576ef07'
    [scope]=$SCOPE_TRAINING
)
declare -A repo35=(
    [url]='https://github.com/nodemailer/nodemailer'
    [search]='lib/**.js'
    [commit]='78bdaf8c9ed023cea825ba36d9cd15151925cc7f'
    [scope]=$SCOPE_TRAINING
)
declare -A repo36=(
    [url]='https://github.com/aws/aws-sdk-js'
    [search]='lib/**.js'
    [ignore]='*browserSha256.js'
    [commit]='bc928565b97b3fd6de96abcccfb4169e358ca1b6'
    [scope]=$SCOPE_TRAINING
)
declare -A repo37=(
    [url]='https://github.com/therealokoro/ToolJS'
    [search]='src/modules/**.js'
    [commit]='0e791e26ab630fe374fd3cf2f62c598797787b86'
    [scope]=$SCOPE_TRAINING
)
declare -A repo38=(
    [url]='https://github.com/validatorjs/validator.js'
    [search]='src/lib/**.js'
    [commit]='b958bd7d1026a434ad3bf90064d3dcb8b775f1a9'
    [scope]=$SCOPE_TRAINING
)
declare -A repo39=(
    [url]='https://github.com/podgorniy/javascript-toolbox'
    [search]='**.js'
    [ignore]='*decorate.js'
    [commit]='5358b6ac2853ca2c8aba4d718ca256787aad72cd'
    [scope]=$SCOPE_TRAINING
)
declare -A repo40=(
    [url]='https://github.com/acode/FunctionScript'
    [search]='lib/**.js'
    [commit]='ca739875ce4a2e5674ec680c82eb35848b5fafd6'
    [scope]=$SCOPE_TRAINING
)
declare -A repo41=(
    [url]='https://github.com/npm/cli'
    [search]='lib/**.js'
    [commit]='7b952f64b882bd891fab5c21c7c3b49838c8a995'
    [scope]=$SCOPE_TRAINING
)
declare -A repo42=(
    [url]='https://github.com/hapijs/joi'
    [search]='lib/**.js'
    [commit]='81277bd9123392cd0b8447065d8615e480b04613'
    [scope]=$SCOPE_TRAINING
)
declare -A repo43=(
    [url]='https://github.com/hapijs/hapi'
    [search]='lib/**.js'
    [commit]='23d65502a6cf5372f6db0acfaac9a5188b9050cd'
    [scope]=$SCOPE_TRAINING
)
declare -A repo44=(
    [url]='https://github.com/hapijs/lab'
    [search]='lib/**.js'
    [commit]='aa39557a97a9bc605807b14d7c4c10a9eb501ffa'
    [scope]=$SCOPE_TRAINING
)
declare -A repo45=(
    [url]='https://github.com/jaredhanson/passport'
    [search]='lib/**.js'
    [commit]='33b92f96616642864844753a481df7c5b823e047'
    [scope]=$SCOPE_TRAINING
)
declare -A repo46=(
    [url]='https://github.com/jaredhanson/oauth2orize'
    [search]='lib/**.js'
    [commit]='89d1b285b6e9c9a7d8a42793c8992ae7e324ad5c'
    [scope]=$SCOPE_TRAINING
)
declare -A repo47=(
    [url]='https://github.com/jaredhanson/electrolyte'
    [search]='lib/**.js'
    [commit]='f92d981ea2a1eedbc65b2af34786e22f9d24d99a'
    [scope]=$SCOPE_TRAINING
)
declare -A repo48=(
    [url]='https://github.com/stfsy/node-amy'
    [search]='lib/**.js'
    [commit]='c048db8a0b582e92a9d5eac68f947fa36b209f3a'
    [scope]=$SCOPE_TRAINING
)

set -e 

mkdir -p code_repositories
mkdir -p raw_training_data
mkdir -p raw_testing_data

cd code_repositories

declare -n repo

for repo in ${!repo@}; do
    commit="${repo[commit]}"
    name="$(basename ${repo[url]})"
    url="${repo[url]}"
    search="${repo[search]}"
    scope="${repo[scope]}"
    search="./$name/$search"
    ignore="${repo[ignore]:-}"
    ignoreCommand="! -wholename *.min.js"

    if [ -n "$ignore" ]; then
        ignoreCommand="$ignoreCommand ! -wholename '$ignore'"
    fi

    if [[ ! -d "$name" ]]; then
        # https://codeandbitters.com/git-shallow-clones/#shallow-clone-a-particular-commit
        git init "$name"
        cd "$name"
        git config --local --add advice.detachedHead false
        git remote add origin "$url"
        git fetch --depth=1 origin "$commit"
        git checkout "$commit"
        cd ..
    fi

    # Use find to locate files matching the regex pattern
    find . -wholename "$search" $ignoreCommand -print0 | while IFS= read -r -d '' file; do
        is_large_file=$(../check_large_file.sh $file)

        if [[ $is_large_file == 'true' ]]; then
            echo "Skipping file $file because it is too large"
            continue
        fi

        # Extract the filename without the path
        filename=$(basename "$file")
        
        # Construct the new filename (modify this part based on your needs)
        new_filename="$name-$filename"
        new_folder="../raw_training_data"

        if [[ "$scope" == "$SCOPE_TEST" ]]; then
            new_folder="../raw_testing_data"
        fi

        # Copy the file to the destination directory with the new filename
        cp "$file" "$new_folder/$new_filename"
    done

    # Remove repository
    rm -rf $name
done

cd ..
rm -rf code_repositories