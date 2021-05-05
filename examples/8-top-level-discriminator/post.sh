# Works correctly by adding defaults when they dont exist
echo "Test 1";
curl -X POST 'http://localhost:3000/v1/pets/nomapping' \
-H 'Content-Type: application/json' \
-d '{"dog": {"pet_type": "dog"}}'
echo;

# Does not add defaults when they nested inside a field using oneOf
echo "Test 2";
curl -X POST 'http://localhost:3000/v1/pets/nomapping' \
-H 'Content-Type: application/json' \
-d '{"pet": {"pet_type": "dog"}}'
echo;

# Does not add defaults when they nested inside an array using oneOf
echo "Test 3";
curl -X POST 'http://localhost:3000/v1/pets/nomapping' \
-H 'Content-Type: application/json' \
-d '{"pets": [{"pet_type": "dog"}]}'
echo;

# However, validation works correctly with nested fields
# This fails correctly
echo "Test 4";
curl -X POST 'http://localhost:3000/v1/pets/nomapping' \
-H 'Content-Type: application/json' \
-d '{"pets": [{"pet_type": "dog", "bark": "no"}]}'
echo;
